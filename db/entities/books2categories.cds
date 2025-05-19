namespace my.library;

using { managed } from '@sap/cds/common';
using { my.library.Books, my.library.Categories } from './_index';

entity Books2Categories : managed {
  key book: Association to Books;
  key category : Association to Categories;
}