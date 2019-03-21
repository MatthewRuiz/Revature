public virtual class Play {
	private String title;
    private String author;
    private String genre;
    
    public Play() {
        this.title = '';
        this.author = '';
        this.genre = '';
    }
    
    public Play(String title) {
        this.title = title;
        this.author = '';
        this.genre = '';
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    
    public void setAuthor(String author) {
        this.author = author;
    }
    
    public void setGenre(String genre) {
        this.genre = genre;
    }
    
    public String getTitle() {
        return this.title;
    }
    
    public String getAuthor() {
        return this.author;
    }
    
    public String getGenre() {
        return this.genre;
    }
    
    public virtual void display() {
        System.debug('Play Information');
        System.debug('Title: ' + this.title);
        System.debug('Author: ' + this.author);
        System.debug('Genre: ' + this.genre);
    }
}