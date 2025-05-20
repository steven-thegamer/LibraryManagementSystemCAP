namespace my.library;

using { cuid, managed } from '@sap/cds/common';
using { my.library.BookTransactions } from './_index';
using { my.dictionary } from '../dictionary/elements';

@assert.unique: {
  email : [ email ]
}

entity Users : cuid, managed {
  name: dictionary.person_name;
  gender : dictionary.gender;
  email: dictionary.email;
  books_history: Association to many BookTransactions on books_history.user = $self;
}