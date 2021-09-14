import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:food_topia/domain/repositories/meals_data_repository.dart';
import 'package:food_topia/domain/usecases/get_meals_data_by_name.dart';
import 'package:food_topia/domain/entities/meals_data.dart';
import 'get_meals_data_test.mocks.dart';


@GenerateMocks([MealsDataRepository])
void main() {
  MockMealsDataRepository mealsDataRepositoryTest = MockMealsDataRepository();
  GetMealsDataById usecase = GetMealsDataById(mealsDataRepositoryTest);

  final id = "52767";
  final tMealsData = MealsData(
      mealsId: "52767",
      mealsName: "Bakewell tart",
      mealsPictURL:
      "https://www.themealdb.com/images/media/meals/wyrqqq1468233628.jpg",
      mealsTags: "Tart,Baking,Alcoholic",
      mealsInstructions:
      "To make the pastry, measure the flour into a bowl and rub in the butter with your fingertips until the mixture resembles fine breadcrumbs. Add the water, mixing to form a soft dough.\r\nRoll out the dough on a lightly floured work surface and use to line a 20cm/8in flan tin. Leave in the fridge to chill for 30 minutes.\r\nPreheat the oven to 200C/400F/Gas 6 (180C fan).\r\nLine the pastry case with foil and fill with baking beans. Bake blind for about 15 minutes, then remove the beans and foil and cook for a further five minutes to dry out the base.\r\nFor the filing, spread the base of the flan generously with raspberry jam.\r\nMelt the butter in a pan, take off the heat and then stir in the sugar. Add ground almonds, egg and almond extract. Pour into the flan tin and sprinkle over the flaked almonds.\r\nBake for about 35 minutes. If the almonds seem to be browning too quickly, cover the tart loosely with foil to prevent them burning.");

  test('Get Meals Data By Id from Repositories', () async {
    when(mealsDataRepositoryTest.getMealsDataById(any))
        .thenAnswer((_) async => Right(tMealsData));
    final result = await usecase(Params(id: id));
    expect(result, Right(tMealsData));
    verify(mealsDataRepositoryTest.getMealsDataById(id));
    verifyNoMoreInteractions(mealsDataRepositoryTest);
  });
}
