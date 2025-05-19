namespace my.library;

using { managed } from '@sap/cds/common';
using { my.library.BookTransactions } from './_index';
using { my.dictionary } from '../dictionary/elements';

entity Users : managed {
  key ID: dictionary.ID;
  name: dictionary.person_name;
  gender : dictionary.gender;
  email: dictionary.email;
  books: Association to many BookTransactions on books.ID = $self.ID;
}