namespace my.library;

using { managed } from '@sap/cds/common';
using { my.library.Books, my.library.Publishers } from './_index';

entity Books2Publishers : managed {
  key book: Association to Books;
  key publisher : Association to Publishers;
}