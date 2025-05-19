namespace my.library;

using { cuid, managed } from '@sap/cds/common';
using { my.library.Books, my.library.Categories } from './_index';

entity Books2Categories : cuid, managed {
  book: Association to Books;
  category : Association to Categories;
}