import 'package:flutter/material.dart';
import 'package:safra_market/models/product.dart';

class ProductInCartContainer extends StatefulWidget {
  final Product product;

  ProductInCartContainer({Key key, this.product}) : super(key: key);

  @override
  _ProductInCartContainerState createState() => _ProductInCartContainerState();
}

class _ProductInCartContainerState extends State<ProductInCartContainer> {
  @override
  Widget build(BuildContext context) {
    var product = widget.product;
    final isAlreadyAdded = cartAddedProducts.contains(product);
    return InkWell(
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.network(product.imageUrl, fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.bottomLeft,
                          //padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                          child: Column(
                            children: [
                              Text(
                                product.productName,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                product.storeName,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          //padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                          child: Column(
                            children: [
                              Text(
                                'R\$ ${product.price.toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '-' + product.discount,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                      padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Container(
                          alignment: Alignment.topRight,
                          child: Icon(Icons.add_circle,
                              size: 30.0,
                              color:
                              isAlreadyAdded ? Colors.green : Colors.white))),
                ),
              ],
            )),
      ),
      onTap: () {
        if(isAlreadyAdded) {
          cartAddedProducts.remove(product);
        } else {
          cartAddedProducts.add(product);
        }
      } ,);
  }
}