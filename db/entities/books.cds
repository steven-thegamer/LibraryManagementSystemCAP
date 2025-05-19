namespace my.library;

using { managed } from '@sap/cds/common';
using { my.dictionary } from '.././dictionary/elements';
using { my.library.Books2Categories, my.library.Books2Authors, my.library.Books2Publishers, my.library.Users } from './_index';

entity Books : managed {
  key title: dictionary.title;
  desc : dictionary.descr;
  book_author: Association to many Books2Publishers on book_author.book = $self;
  book_publisher : Association to Books2Authors on book_publisher.book = $self;
  book_category : Association to Books2Categories on book_category.book = $self;
  currentPossessor : Association to Users;
}