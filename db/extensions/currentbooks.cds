namespace my.library;

using { my.library.Books } from '../entities/books';
using { my.library.Users } from '../entities/users';

extend Books with {
    currentPossessor : Association to Users;
}