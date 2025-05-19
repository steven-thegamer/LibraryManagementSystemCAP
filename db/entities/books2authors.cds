namespace my.library;

using { cuid, managed } from '@sap/cds/common';
using { my.library.Books, my.library.Authors } from './_index';

entity Books2Authors : cuid, managed {
  book: Association to Books;
  author : Association to Authors;
}