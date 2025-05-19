namespace my.library;

using { cuid, managed } from '@sap/cds/common';
using { my.library.Books, my.library.Publishers } from './_index';

entity Books2Publishers : cuid, managed {
  book: Association to Books;
  publisher : Association to Publishers;
}