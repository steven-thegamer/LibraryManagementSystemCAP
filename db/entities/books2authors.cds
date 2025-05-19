namespace my.library;

using { managed } from '@sap/cds/common';
using { my.library.Books, my.library.Authors } from './_index';

entity Books2Authors : managed {
  key book: Association to one Books;
  key author : Association to one Authors;
}