import 'package:training_app/models/models.dart';

class StudentRepository {
  StudentRepository._privateConstructor();
  static final StudentRepository instance = StudentRepository._privateConstructor();

  Future<List<Student>> getStudents({required int x}) {
    /*
    - this function will be "asynchronous"
    - It will be an async/await OR Future(Promise in js)
    - It may delay 2 seconds => function of "calling fake apis"
    - show Loading within 2 seconds
     * */
    //timer
    return Future.delayed(const Duration(milliseconds: 15000), () {
      //Promise in js, async/await
      //Future in js, async/await
      if(x == -22) {
        return Future.error("Cannot get data from Server");
      }
      //successful
      return Future.value([
        Student(
          name: 'Nguyen Duc Hoang',
          email: 'hoang@gmail.com',
          slogan: 'Think first',
          url: 'https://www.thesprucepets.com/thmb/FpAKHIGPMDpX6sHu_Oa2QKaJJzY=/1080x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/33425933_857929994407980_2290790978497282048_n-5b266393eb97de0036658c65.jpg',
        ),
        Student(
          name: 'Nguyedsdfsdn Duc Hoang',
          email: 'hoang@gmail.com',
          slogan: ' as soosn as possible',
          url: 'https://d17fnq9dkz9hgj.cloudfront.net/uploads/2012/11/147698488-cat-allergies-632x475-112x84.jpg',
        ),
        Student(
          name: 'Nguyeween Duc Hoang',
          email: 'hoang@gmail.com',
          slogan: 'Best quality',
          url: 'https://d17fnq9dkz9hgj.cloudfront.net/uploads/2012/11/140447576-tips-for-first-30-days-cat-632x475-112x84.jpg',
        ),
        Student(
          name: 'Nguyen Duc Hoang',
          email: 'hoang@gmail.com',
          slogan: 'low price',
          url: 'https://d17fnq9dkz9hgj.cloudfront.net/uploads/2012/11/99233806-bringing-home-new-cat-632x475.jpg',
        ),
        Student(
          name: 'Nguewe2wyen Duc Hoang',
          email: 'hoang@gmail.com',
          slogan: 'bigger is good',
          url: 'https://www.thesprucepets.com/thmb/2NMlovy8LQ0C-knQJToYgAMtM30=/1800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/why-cats-are-better-than-dogs-554880-04-d48b5438e36345b79daf60c486181aeb.jpg',
        ),
        Student(
          name: 'Nguybfgen Duc Hoang',
          email: 'hoang@gmail.com',
          slogan: 'think differentn',
          url: 'https://www.thesprucepets.com/thmb/2NMlovy8LQ0C-knQJToYgAMtM30=/1800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/why-cats-are-better-than-dogs-554880-04-d48b5438e36345b79daf60c486181aeb.jpg',
        ),
        Student(
          name: 'Nguewe2wyen Duc Hoang',
          email: 'hoang@gmail.com',
          slogan: 'bigger is good',
          url: 'https://www.thesprucepets.com/thmb/2NMlovy8LQ0C-knQJToYgAMtM30=/1800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/why-cats-are-better-than-dogs-554880-04-d48b5438e36345b79daf60c486181aeb.jpg',
        ),
        Student(
          name: 'Nguybfgen Duc Hoang',
          email: 'hoang@gmail.com',
          slogan: 'think differentn',
          url: 'https://www.thesprucepets.com/thmb/2NMlovy8LQ0C-knQJToYgAMtM30=/1800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/why-cats-are-better-than-dogs-554880-04-d48b5438e36345b79daf60c486181aeb.jpg',
        ),
        Student(
          name: 'Nguewe2wyen Duc Hoang',
          email: 'hoang@gmail.com',
          slogan: 'bigger is good',
          url: 'https://www.thesprucepets.com/thmb/2NMlovy8LQ0C-knQJToYgAMtM30=/1800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/why-cats-are-better-than-dogs-554880-04-d48b5438e36345b79daf60c486181aeb.jpg',
        ),
        Student(
          name: 'Nguybfgen Duc Hoang',
          email: 'hoang@gmail.com',
          slogan: 'think differentn',
          url: 'https://www.thesprucepets.com/thmb/2NMlovy8LQ0C-knQJToYgAMtM30=/1800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/why-cats-are-better-than-dogs-554880-04-d48b5438e36345b79daf60c486181aeb.jpg',
        ),
        Student(
          name: 'Nguewe2wyen Duc Hoang',
          email: 'hoang@gmail.com',
          slogan: 'bigger is good',
          url: 'https://www.thesprucepets.com/thmb/2NMlovy8LQ0C-knQJToYgAMtM30=/1800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/why-cats-are-better-than-dogs-554880-04-d48b5438e36345b79daf60c486181aeb.jpg',
        ),
        Student(
          name: 'Nguybfgen Duc Hoang',
          email: 'hoang@gmail.com',
          slogan: 'think differentn',
          url: 'https://www.thesprucepets.com/thmb/2NMlovy8LQ0C-knQJToYgAMtM30=/1800x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/why-cats-are-better-than-dogs-554880-04-d48b5438e36345b79daf60c486181aeb.jpg',
        )
      ]);
    });

  }
}