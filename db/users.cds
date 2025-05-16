namespace my.library;

using { managed } from '@sap/cds/common';
using { my.library.BookTransactions } from './library';

type Gender : String(1) enum {
    male = 'm';
    female = 'f';
    nonbinary = 'n';
    other = 'o';
}

entity Users : managed {
  key ID: Integer;
  name: String(100);
  gender : Gender;
  email: String(100);
  books: Association to many BookTransactions on books.ID = $self.ID;
}