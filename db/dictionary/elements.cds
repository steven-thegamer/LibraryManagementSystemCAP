namespace my.dictionary;

using { my.dictionary } from './domains';

type title : String(100) @title;
type descr : String(500) @description;
type gender : dictionary.Gender;
type person_name : String(100) @title;
type category_name : String(100) @title;
type publisher_name : String(100) @title;
type email : String(100) @title;
type ID : Integer @title;
type borrowDate : DateTime @title;
type returnDate : DateTime @title;