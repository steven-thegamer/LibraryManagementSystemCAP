namespace my.dictionary;

using { my.dictionary } from './domains';

type title : String(100) @title:'Book Title' @description : 'The title of the book' @mandatory;
type descr : String(500) @title:'Book Description' @description : 'A short description of the book';
type gender : dictionary.Gender @title : 'Gender' @description : 'The person''s gender' @mandatory;
type person_name : String(100) @title:'Name' @description : 'The person''s name' @mandatory;
type publisher_name : String(100) @title:'Publisher' @description : 'The publisher of the book' @mandatory;
type email : String(100) @title:'Email' @description : 'The email of the user' @mandatory;
type borrowDate : Date @title : 'Borrow Date' @description : 'The date when the book was borrowed';
type returnDate : Date @title : 'Return Date' @description : 'The date when the book was supposed to be returned';