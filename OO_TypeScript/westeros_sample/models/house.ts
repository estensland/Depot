///<reference path='../mixins/books_in.ts'/>

class House implements BooksIn {
  name: string;
  sigil: string;
  motto: string;

  constructor(name: string, sigil: string, motto: string) {
    this.name = name;
    this.sigil = sigil;
    this.motto = motto;
  }

  describe() {
    return "The sigil of House " + this.name + " is " + this.sigil + ", and its words are " + this.motto;
  }

  books: Array<Book>;
  addBooks: () => void;
}

applyMixins(House, [BooksIn])
