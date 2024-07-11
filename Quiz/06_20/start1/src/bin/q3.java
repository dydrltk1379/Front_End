package bin;

public class q3 {
    public static void main(String[] args) {
        Book[] b = new Book[2];
        b[0] = new Book("happy", "kim", "k100");
        b[1] = new Book("smile", "park", "k200");
        for(Book member:b){
            member.displayInfo();
        }
    }
}
class Book{
    private String title;
    private String author;
    private String isbn;

    public Book() {
    }

    public Book(String title, String author, String isbn) {
        this.title = title;
        this.author = author;
        this.isbn = isbn;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public void displayInfo(){
        final StringBuilder sb = new StringBuilder("Title: ");
        sb.append(title).append(", Author: ").append(author)
                .append(", ISBN: ").append(isbn).append("\n");
        System.out.println(sb.toString());
    }
}