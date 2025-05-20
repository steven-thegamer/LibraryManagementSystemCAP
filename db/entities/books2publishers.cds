namespace my.library;

using { cuid, managed } from '@sap/cds/common';
using { my.library.Books, my.library.Publishers } from './_index';

entity Books2Publishers : cuid, managed {
  key book: Association to one Books;
  key publisher : Association to one Publishers;
}