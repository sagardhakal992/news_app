
class NewsModel{
  String title;
  String description;
  int id;
  String? imageUrl;
  int author;
  String link;


  NewsModel({required this.id,required this.title,this.imageUrl,required this.description,required this.author,required this.link});

   factory NewsModel.fromJson(Map<String,dynamic>json){

     var ids=json['id'];
     var titles=json['title']["rendered"];
     var descriptions=json['content']["rendered"];
     var imageUrls=json['_embedded']["wp:featuredmedia"]!=null?json['_embedded']["wp:featuredmedia"][0]["source_url"]:"https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg";
     var authors=json['author'];
     var links=json['link'];
     return NewsModel(id: ids, title: titles, description: descriptions, author: authors,imageUrl: imageUrls,link: links);
  }

}