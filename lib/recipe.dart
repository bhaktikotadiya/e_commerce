class recipe {
  dynamic id;
  dynamic title;
  dynamic course;
  dynamic cuisine;
  dynamic mainIngredient;
  dynamic description;
  dynamic source;
  dynamic url;
  dynamic urlHost;
  dynamic prepTime;
  dynamic cookTime;
  dynamic totalTime;
  dynamic servings;
  dynamic yield;
  dynamic ingredients;
  dynamic directions;
  dynamic tags;
  dynamic rating;
  dynamic publicUrl;
  dynamic photoUrl;
  dynamic private;
  dynamic nutritionalScoreGeneric;
  dynamic calories;
  dynamic fat;
  dynamic cholesterol;
  dynamic sodium;
  dynamic sugar;
  dynamic carbohydrate;
  dynamic fiber;
  dynamic protein;
  dynamic cost;

  recipe(
      {this.id,
        this.title,
        this.course,
        this.cuisine,
        this.mainIngredient,
        this.description,
        this.source,
        this.url,
        this.urlHost,
        this.prepTime,
        this.cookTime,
        this.totalTime,
        this.servings,
        this.yield,
        this.ingredients,
        this.directions,
        this.tags,
        this.rating,
        this.publicUrl,
        this.photoUrl,
        this.private,
        this.nutritionalScoreGeneric,
        this.calories,
        this.fat,
        this.cholesterol,
        this.sodium,
        this.sugar,
        this.carbohydrate,
        this.fiber,
        this.protein,
        this.cost});

  recipe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    course = json['course'];
    cuisine = json['cuisine'];
    mainIngredient = json['mainIngredient'];
    description = json['description'];
    source = json['source'];
    url = json['url'];
    urlHost = json['urlHost'];
    prepTime = json['prepTime'];
    cookTime = json['cookTime'];
    totalTime = json['totalTime'];
    servings = json['servings'];
    yield = json['yield'];
    ingredients = json['ingredients'];
    directions = json['directions'];
    tags = json['tags'];
    rating = json['rating'];
    publicUrl = json['publicUrl'];
    photoUrl = json['photoUrl'];
    private = json['private'];
    nutritionalScoreGeneric = json['nutritionalScoreGeneric'];
    calories = json['calories'];
    fat = json['fat'];
    cholesterol = json['cholesterol'];
    sodium = json['sodium'];
    sugar = json['sugar'];
    carbohydrate = json['carbohydrate'];
    fiber = json['fiber'];
    protein = json['protein'];
    cost = json['cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['course'] = this.course;
    data['cuisine'] = this.cuisine;
    data['mainIngredient'] = this.mainIngredient;
    data['description'] = this.description;
    data['source'] = this.source;
    data['url'] = this.url;
    data['urlHost'] = this.urlHost;
    data['prepTime'] = this.prepTime;
    data['cookTime'] = this.cookTime;
    data['totalTime'] = this.totalTime;
    data['servings'] = this.servings;
    data['yield'] = this.yield;
    data['ingredients'] = this.ingredients;
    data['directions'] = this.directions;
    data['tags'] = this.tags;
    data['rating'] = this.rating;
    data['publicUrl'] = this.publicUrl;
    data['photoUrl'] = this.photoUrl;
    data['private'] = this.private;
    data['nutritionalScoreGeneric'] = this.nutritionalScoreGeneric;
    data['calories'] = this.calories;
    data['fat'] = this.fat;
    data['cholesterol'] = this.cholesterol;
    data['sodium'] = this.sodium;
    data['sugar'] = this.sugar;
    data['carbohydrate'] = this.carbohydrate;
    data['fiber'] = this.fiber;
    data['protein'] = this.protein;
    data['cost'] = this.cost;
    return data;
  }

  @override
  String toString() {
    return 'recipe{id: $id, title: $title, course: $course, cuisine: $cuisine, mainIngredient: $mainIngredient, description: $description, source: $source, url: $url, urlHost: $urlHost, prepTime: $prepTime, cookTime: $cookTime, totalTime: $totalTime, servings: $servings, yield: $yield, ingredients: $ingredients, directions: $directions, tags: $tags, rating: $rating, publicUrl: $publicUrl, photoUrl: $photoUrl, private: $private, nutritionalScoreGeneric: $nutritionalScoreGeneric, calories: $calories, fat: $fat, cholesterol: $cholesterol, sodium: $sodium, sugar: $sugar, carbohydrate: $carbohydrate, fiber: $fiber, protein: $protein, cost: $cost}';
  }
}