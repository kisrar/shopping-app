class ProductsResponseModel {
    ProductsResponseModel({
        required this.products,
        required this.totalRecords,
        required this.pageSize,
        required this.pageNo,
        required this.heroImage,
    });

    List<Product>? products;
    int? totalRecords;
    int? pageSize;
    int? pageNo;
    List<HeroImage?>? heroImage;

    factory ProductsResponseModel.fromJson(Map<String, dynamic> json) {
      json = json['data'];
      return ProductsResponseModel(
        products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
        totalRecords: json["total_records"],
        pageSize: json["page_size"],
        pageNo: json["page_no"],
        heroImage: json["hero_image"] == null ? [] : List<HeroImage?>.from(json["hero_image"]!.map((x) => HeroImage.fromJson(x))),
    );
    }
}

class HeroImage {
    HeroImage({
        required this.desktopImage,
        required this.mobileImage,
    });

    String? desktopImage;
    String? mobileImage;

    factory HeroImage.fromJson(Map<String, dynamic> json) => HeroImage(
        desktopImage: json["desktop_image"],
        mobileImage: json["mobile_image"],
    );


}

class Product {
    Product({
        required this.id,
        required this.name,
        required this.urlKey,
        required this.variantAttributeGroupId,
        required this.rating,
        required this.discountPercentage,
        required this.image,
        required this.mrp,
        required this.salePrice,
        required this.variants,
    });

    String? id;
    String? name;
    String? urlKey;
    String? variantAttributeGroupId;
    int? rating;
    int? discountPercentage;
    String? image;
    int? mrp;
    int? salePrice;
    List<Variant?>? variants;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        urlKey: json["url_key"],
        variantAttributeGroupId: json["variant_attribute_group_id"],
        rating: json["rating"],
        discountPercentage: json["discount_percentage"],
        image: 'https://my-beauty-world.s3.ap-south-1.amazonaws.com/${json["image"]}',
        mrp: json["mrp"],
        salePrice: json["sale_price"],
        variants: json["variants"] == null ? [] : json["variants"] == null ? [] : List<Variant?>.from(json["variants"]!.map((x) => Variant.fromJson(x))),
    );


}

class Variant {
    Variant({
        required this.attributeId,
        required this.attributeName,
        required this.attributeType,
        required this.attributeOptionId,
        required this.attributeOptionName,
        required this.colorCode,
        required this.variantAttributeGroupId,
        required this.id,
        required this.urlKey,
        required this.mrp,
        required this.salePrice,
    });

    String? attributeId;
    String? attributeName;
    String? attributeType;
    String? attributeOptionId;
    String? attributeOptionName;
    String? colorCode;
    String? variantAttributeGroupId;
    String? id;
    String? urlKey;
    int? mrp;
    int? salePrice;

    factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        attributeId: json["attribute_id"],
        attributeName: json["attribute_name"],
        attributeType: json["attribute_type"],
        attributeOptionId: json["attribute_option_id"],
        attributeOptionName: json["attribute_option_name"],
        colorCode: json["color_code"],
        variantAttributeGroupId: json["variant_attribute_group_id"],
        id: json["id"],
        urlKey: json["url_key"],
        mrp: json["mrp"],
        salePrice: json["sale_price"],
    );

}

