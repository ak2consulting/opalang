/*
    Copyright © 2011 MLstate

    This file is part of OPA.

    OPA is free software: you can redistribute it and/or modify it under the
    terms of the GNU Affero General Public License, version 3, as published by
    the Free Software Foundation.

    OPA is distributed in the hope that it will be useful, but WITHOUT ANY
    WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
    FOR A PARTICULAR PURPOSE.  See the GNU Affero General Public License for
    more details.

    You should have received a copy of the GNU Affero General Public License
    along with OPA.  If not, see <http://www.gnu.org/licenses/>.
*/

/**
 * TestSuite, Tools for unit testing (with external scripts that catch "TEST KO", etc.)
 *
**/

/**
 * {1 About this module}
 *
 * API used in unit tests
 *
 * {1 Where should I start?}
 *
 * {1 What if I need more?}
**/

/**
 * {1 Types defined in this module}
 */

@abstract type TestSuite.t = {
  list : list(-> void) ;
  title : string ;
}

/**
 * {1 Interface}
 */

TestSuite = {{

  barsize = 70

  bar = String.repeat(barsize, "#")

  empty : TestSuite.t =
    {list = []; title = "TestSuite"}

  create(title) : TestSuite.t =
    title = "### LAUNCH : " ^ title
    title = i = (barsize-1) - String.length(title)
      if i > 0 then
        title ^ " " ^ String.repeat(i, "#")
      else title
    {list = []; title = title}

  add(suite:TestSuite.t, test) : TestSuite.t =
    {suite with list=test +> suite.list}

  run(suite:TestSuite.t) =
    do prerr(bar ^ "\n")
    do prerr(suite.title ^ "\n")
    List.fold_backwards((f, _ -> f()), suite.list, {})

}}
