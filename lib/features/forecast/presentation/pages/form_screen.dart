import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_mobile/features/forecast/domain/entities/province.dart';
import 'package:weather_mobile/features/forecast/presentation/bloc/region/region_bloc.dart';
import 'package:weather_mobile/features/forecast/presentation/bloc/region/region_event.dart';
import 'package:weather_mobile/features/forecast/presentation/bloc/region/region_state.dart';
import 'package:weather_mobile/features/forecast/presentation/pages/weather_screen.dart';
import 'package:weather_mobile/features/forecast/presentation/widgets/buttons/container_button.dart';
import 'package:weather_mobile/features/forecast/presentation/widgets/inputs/rounded_searchable_drop_down.dart';
import '../../../../core/resources/theme/colors.dart';
import '../../../../injection_container.dart';
import '../widgets/inputs/rounded_icon_text_field.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  FormScreenState createState() => FormScreenState();
}

class FormScreenState extends State<FormScreen> {
  late String _name = "";
  late String _province = "";
  late String _city = "";
  late Color _buttonColor = AppColors.greyDisableButton;
  late bool _isAllSets = false;
  late bool _isProvinceLoading = true;
  late bool _isProvinceError = false;
  late String _provincePlaceholder = "Please Wait";
  late List<String> _stringProvince = [];
  late List<String> _stringCity = [];
  late List<ProvinceEntity> _provinceList = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegionBloc>(
      create: (context) => sl()..add(const GetProvinces()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
              child: Container(
                padding: const EdgeInsetsDirectional.only(start: 16, end: 14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 228),
                    const Text(
                        'Technical Assessment Mobile App Developer',
                        style: TextStyle(
                            color: AppColors.boldText,
                            fontSize: 24,
                            fontWeight: FontWeight.w600
                        ),
                        textAlign: TextAlign.center
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Enter your full name, province, and city to continue.',
                        style: TextStyle(
                            color: AppColors.regularText,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 40),
                    RoundedIconTextField(
                      hintText: 'John Doe',
                      icon: Icons.person_outline_outlined,
                      inputType: TextInputType.text,
                      isSecureText: false,
                      onChanged: (value) {
                        setState(() {
                          _name = value;
                          setState(() {
                            _updateButtonColor();
                          });
                        });
                      },
                      isLoading: false,
                      isError: false,
                    ),
                    const SizedBox(height: 10),
                    BlocListener<RegionBloc, RegionState>(
                      listener: (blocContext, state) {
                        if (state is ProvinceLoading) {
                          setState(() {
                            _isProvinceLoading = true;
                            _isProvinceError = false;
                            _provincePlaceholder = "Please Wait";
                            _stringProvince = [];
                          });
                        } else if (state is ProvinceError) {
                          setState(() {
                            _isProvinceLoading = false;
                            _isProvinceError = true;
                            _provincePlaceholder = state.error.message ?? "Error";
                          });
                        } else if (state is ProvinceDone) {
                          setState(() {
                            _isProvinceLoading = false;
                            _isProvinceError = false;
                            _provincePlaceholder = "Select Province";
                            _provinceList = state.provinces;
                            _stringProvince = state.provinces.map((data) => data.name ?? "-").toList();
                          });
                        }
                      },
                      child: Builder(
                        builder: (blocContext) {
                          return _buildProvince(
                            _isProvinceLoading,
                            _isProvinceError,
                            _provincePlaceholder,
                            _stringProvince,
                            blocContext,
                          );
                        },
                      ),
                    ),
                    // BlocBuilder<RegionBloc, RegionState>(
                    //   builder: (blocContext, state) {
                    //     if (state is ProvinceLoading) {
                    //       return _buildProvince(true, false, "Please Wait", [], blocContext);
                    //     }
                    //     if (state is ProvinceError) {
                    //       return _buildProvince(false, true, state.error.message, [], blocContext);
                    //     }
                    //     if (state is ProvinceDone) {
                    //       _provinceList = state.provinces;
                    //       _stringProvince = state.provinces.map((data) => data.name ?? "-").toList();
                    //       return _buildProvince(false, false, "Select Province", _stringProvince, blocContext);
                    //     }
                    //     return SizedBox();
                    //   }
                    // ),
                    const SizedBox(height: 10),
                    BlocBuilder<RegionBloc, RegionState>(
                        builder: (_, state) {
                          if (state is CityLoading) {
                            return _buildCity(true, false, "Please Wait", [], context);
                          }
                          if (state is CityError) {
                            return _buildCity(false, true, state.error.message, [], context);
                          }
                          if (state is CityDone) {
                            _stringCity = state.cities.map((data) => data.name ?? "-").toList();
                            return _buildCity(false, false, "Select City", _stringCity, context);
                          }
                          return _buildCity(false, false, "Please select province first", [], context);
                        }
                    ),
                    const SizedBox(height: 26),
                    ContainerButton(
                        label: "Next",
                        color: _buttonColor,
                        icon: Icons.arrow_forward,
                        onPressed: () {
                          if (_isAllSets) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WeatherScreen(cityName: _city, name: _name,),
                              ),
                            );
                          }
                        }
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              )
          ),
        ),
      )
    );
  }

  Widget _buildProvince(bool isLoading, bool isError, String? placeholder, List<String> provinceList, BuildContext context) {
    return RoundedSearchableDropDown(
      isLoading: isLoading,
      isError: isError,
      dataList: provinceList,
      hintText: "Search",
      placeholder: placeholder ?? "Select Province",
      onChanged: (value) {
        _province = value ?? "";
        BlocProvider.of<RegionBloc>(context).add(GetCities(_onProvinceSelected(value ?? "") ?? "-"));
      }
    );
  }

  Widget _buildCity(bool isLoading, bool isError, String? placeholder, List<String> provinceList, BuildContext context) {
    return RoundedSearchableDropDown(
      isLoading: isLoading,
      isError: isError,
      dataList: provinceList,
      hintText: "Search",
      placeholder: placeholder ?? "Select City",
      onChanged: (value) {
        _city = value ?? "";
        setState(() {
          _updateButtonColor();
        });
      }
    );
  }

  void _updateButtonColor() {
    if (_name.isNotEmpty && _province.isNotEmpty && _city.isNotEmpty) {
      _buttonColor = AppColors.blueAttribute;
      _isAllSets = true;
    } else {
      _buttonColor = AppColors.greyDisableButton;
      _isAllSets = false;
    }
  }

  String? _onProvinceSelected(String selectedName) {
    final selectedProvince = _provinceList.firstWhere(
          (province) => province.name == selectedName,
    );

    return selectedProvince.id;
  }
}