namespace my.library;

using { managed } from '@sap/cds/common';
using { my.library.Books } from './books';
using { my.library.Users } from './users';

entity AvailableBooks as projection on Books excluding {
    createdAt,
    createdBy,
    modifiedAt,
    modifiedBy
}
extend Books with {
    currentPossession : Association to Users;
}

entity BookTransactions : managed {
  key ID: Integer;
  book: Association to many Books on book.ID = $self.ID;
  user: Association to many Users on user.ID = $self.ID;
  borrowDate: DateTime;
  returnDate: DateTime;
}

