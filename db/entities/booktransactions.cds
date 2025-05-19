namespace my.library;

using { cuid, managed } from '@sap/cds/common';
using { my.dictionary } from '../dictionary/elements';
using { my.library.Books, my.library.Users } from './_index';

entity BookTransactions : cuid, managed {
  book: Association to many Books on book.currentPossessor = $self.user;
  user: Association to Users;
  borrowDate: dictionary.borrowDate;
  returnDate: dictionary.returnDate;
}

