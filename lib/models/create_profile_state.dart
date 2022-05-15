// 1. Import this:
import 'package:freezed_annotation/freezed_annotation.dart';

// 2. Declare this:
part 'create_profile_state.freezed.dart';

// 3. Annotate the class with @freezed
@freezed
// 4. Declare the class as abstract and add `with _$ClassName`
abstract class CreateProfileState with _$CreateProfileState {
  // 5. Create a `const factory` constructor for each valid state
  const factory CreateProfileState.noError() = _NoError;
  const factory CreateProfileState.error(String errorText) = _Error;
  const factory CreateProfileState.loading() = _Loading;
}
