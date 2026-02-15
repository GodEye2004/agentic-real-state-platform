import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/api/api_service.dart';
import 'package:flutter_application_1/config/theme.dart';
import 'package:flutter_application_1/featured/property-submit/widget/mode_selection.dart';
import 'package:flutter_application_1/featured/property-submit/widget/voice_controller.dart';
import 'package:go_router/go_router.dart';
import 'dart:convert';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:uuid/uuid.dart';


enum InputMode { none, manual, voice }

class AddPropertyScreen extends StatefulWidget {
  const AddPropertyScreen({Key? key}) : super(key: key);

  @override
  State<AddPropertyScreen> createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  final ApiService _apiService = ApiService();
  InputMode _inputMode = InputMode.none;
  int _currentStep = 0;
  bool _isSubmitting = false;

  // --- Voice / Speech Vars ---
  late stt.SpeechToText _speech;
  bool _isListening = false;
  bool _speechEnabled = false;
  String _lastWords = '';

  // Voice Chat Logic
  final TextEditingController _voiceInputController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  // final List<Message> _voiceMessages = [];
  bool _isProcessingVoice = false;

  // --- Form Keys & Controllers ---
  final _basicFormKey = GlobalKey<FormState>();
  final _locationFormKey = GlobalKey<FormState>();
  final _detailsFormKey = GlobalKey<FormState>();
  final _facilitiesFormKey = GlobalKey<FormState>();
  final _contactFormKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _bedroomsController = TextEditingController();
  final TextEditingController _yearBuiltController = TextEditingController();
  final TextEditingController _floorController = TextEditingController();
  final TextEditingController _totalFloorsController = TextEditingController();
  final TextEditingController _exchangePreferencesController =
      TextEditingController();

  String? _propertyType;
  String? _transactionType;
  String? _documentType;
  bool _hasParking = false;
  bool _hasElevator = false;
  bool _hasStorage = false;
  bool _isRenovated = false;
  bool _openToExchange = false;

  // --- Lists & Constants ---
  final List<String> _propertyTypes = [
    'آپارتمان',
    'ویلا',
    'مغازه',
    'زمین',
    'اداری',
  ];

  final List<String> _transactionTypes = ['فروش', 'اجاره'];
  final List<String> _documentTypes = ['تک برگ', 'مشاع', 'وقفی', 'اجاره‌ای'];

  static const Map<String, String> propertyTypeMap = {
    'آپارتمان': 'APARTMENT',
    'ویلا': 'VILLA',
    'مغازه': 'SHOP',
    'زمین': 'LAND',
    'اداری': 'OFFICE',
  };

  static const Map<String, String> transactionTypeMap = {
    'فروش': 'SALE',
    'اجاره': 'RENT',
  };

  static const Map<String, String> documentTypeMap = {
    'تک برگ': 'SINGLE_PAGE',
    'مشاع': 'SHARED',
    'وقفی': 'ENDOWED',
    'اجاره‌ای': 'LEASED',
  };

  // A small list of common Tehran districts for detection
  final List<String> _knownDistricts = [
    'ولنجک',
    'نیاوران',
    'زعفرانیه',
    'تجریش',
    'الهیه',
    'فرشته',
    'جردن',
    'ونک',
    'سعادت آباد',
    'شهرک غرب',
    'پاسداران',
    'اقدسیه',
    'فرمانیه',
    'کامرانیه',
    'دروس',
    'قلهک',
    'میرداماد',
    'ظفر',
    'سیدخندان',
    'نارمک',
    'تهرانپارس',
    'پیروزی',
    'نیروی هوایی',
    'یوسف آباد',
    'امیرآباد',
    'گیشا',
    'مرزداران',
    'ستارخان',
    'صادقیه',
    'پونک',
    'جنت آباد',
    'شهران',
    'دهکده المپیک',
    'چیتگر',
    'دریاچه',
    'خانی آباد',
    'نازی آباد',
    'فلاح',
    'جمهوری',
    'فاطمی',
  ];

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _initSpeech();
  }

  void _initSpeech() async {
    try {
      _speechEnabled = await _speech.initialize(
        onStatus: (status) => print('Speech Status: $status'),
        onError: (errorNotification) =>
            print('Speech Error: $errorNotification'),
      );
      setState(() {});
    } catch (e) {
      print("Speech initialization failed: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyContent;
    String title = 'ثبت آگهی رایگان';

    switch (_inputMode) {
      case InputMode.none:
        bodyContent = ModeSelection(
          onVoiceTap: () {
            setState(() {
              _inputMode = InputMode.voice;
              // _voiceMessages.clear();
              _addSystemMessage(
                'سلام! من دستیار هوشمند شما هستم. 👋\n\nلطفاً مشخصات ملکتان را بگویید یا بنویسید.\nمثلاً: "یک آپارتمان ۱۰۰ متری در ولنجک دارم که ۵ میلیارد قیمت گذاشتم..."',
              );
            });
          },
          onManualTap: () {
            setState(() {
              _inputMode = InputMode.manual;
              _currentStep = 0;
            });
          },
        );
        break;
      case InputMode.voice:
        title = 'ثبت هوشمند';
        bodyContent = _buildVoiceInput();
        break;
      case InputMode.manual:
        title = 'ثبت آگهی - دستی';
        bodyContent = Stepper(
          currentStep: _currentStep,
          onStepContinue: _onStepContinue,
          onStepCancel: _onStepCancel,
          controlsBuilder: _buildControls,
          type: StepperType.vertical,
          steps: [
            _buildBasicInfoStep(),
            _buildLocationStep(),
            _buildDetailsStep(),
            _buildFacilitiesStep(),
            _buildContactStep(),
          ],
        );
        break;
    }

    return WillPopScope(
      onWillPop: () async {
        if (_inputMode != InputMode.none) {
          setState(() {
            _inputMode = InputMode.none;
            // _voiceMessages.clear();
            _isListening = false;
            _speech.stop();
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        appBar: AppBar(
          title: Text(title, style: Theme.of(context).textTheme.headlineSmall),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              if (_inputMode != InputMode.none) {
                setState(() {
                  _inputMode = InputMode.none;
                  // _voiceMessages.clear();
                  _isListening = false;
                  _speech.stop();
                });
              } else {
                context.go('/home');
              }
            },
          ),
        ),
        body: bodyContent,
      ),
    );
  }

  // --- Voice / Chat Input ---
  Widget _buildVoiceInput() {
    return Column(
      children: [
        // Expanded(
        //   child: MessageList(
        //     scrollController: _scrollController,
        //     messages: _voiceMessages,
        //     isTyping: _isProcessingVoice,
        //   ),
        // ),
        VoiceControls(
          isListening: _isListening,
          lastWords: _lastWords,
          controller: _voiceInputController,
          onToggleListening: _toggleListening,
          onSend: () {
            if (_voiceInputController.text.trim().isNotEmpty) {
              _handleUserMessage(_voiceInputController.text);
            }
          },
          onConfirm: () {
            setState(() {
              _inputMode = InputMode.manual;
              _currentStep = 0;
            });
          },
          hasExtractedData: _hasExtractedData(),
        ),
      ],
    );
  }

  // --- Speech Logic ---
  void _toggleListening() async {
    if (!_speechEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('دسترسی میکروفون یا تشخیص گفتار وجود ندارد'),
        ),
      );
      return;
    }

    if (_isListening) {
      await _speech.stop();
      setState(() => _isListening = false);

      // Manual Send on Stop
      if (_voiceInputController.text.trim().isNotEmpty) {
        _handleUserMessage(_voiceInputController.text);
      }
    } else {
      setState(() {
        _isListening = true;
        _lastWords = '';
        _voiceInputController.clear();
      });
      try {
        await _speech.listen(
          onResult: _onSpeechResult,
          localeId: 'fa_IR',
          cancelOnError: true,
          listenFor: const Duration(seconds: 300), // Increased to 5 minutes
          pauseFor: const Duration(
            seconds: 60,
          ), // Increased silence tolerance to 60s
        );
      } catch (e) {
        setState(() => _isListening = false);
        print("Listen error: $e");
      }
    }
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
      _voiceInputController.text = _lastWords;

      if (result.finalResult) {
        // Just stop listening state, DO NOT auto-send.
        _isListening = false;
      }
    });
  }

  // --- Handlers ---
  void _addSystemMessage(String content) {
    setState(() {
      // _voiceMessages.add(
      //   Message(
      //     id: const Uuid().v4(),
      //     content: content,
      //     isUser: false,
      //     timestamp: DateTime.now(),
      //   ),
      // );
    });
    _scrollToBottom();
  }

  Future<void> _handleUserMessage(String text) async {
    _voiceInputController.clear();
    setState(() {
      // _voiceMessages.add(
      //   Message(
      //     id: const Uuid().v4(),
      //     content: text,
      //     isUser: true,
      //     timestamp: DateTime.now(),
      //   ),
      // );
      _isProcessingVoice = true;
    });
    _scrollToBottom();

    // Emulate "Thinking"
    await Future.delayed(const Duration(seconds: 1));

    // Intelligence: Extract Data
    final summary = _extractPropertyDetails(text);

    setState(() {
      _isProcessingVoice = false;

      String responseText;
      if (summary.isEmpty) {
        responseText =
            'متاسفانه نتوانستم اطلاعات خاصی استخراج کنم. لطفا دقیق‌تر بگویید. (مثلا: "آپارتمان ۱۰۰ متری در نیاوران")';
      } else {
        responseText =
            'اطلاعاتی که متوجه شدم:\n$summary\n\nاگر این اطلاعات صحیح است، دکمه سبز پایین را بزنید. اگر نه، دوباره توضیح دهید.';
      }

      // _voiceMessages.add(
      //   Message(
      //     id: const Uuid().v4(),
      //     content: responseText,
      //     isUser: false,
      //     timestamp: DateTime.now(),
      //   ),
      // );
    });
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  bool _hasExtractedData() {
    return _propertyType != null ||
        _areaController.text.isNotEmpty ||
        _priceController.text.isNotEmpty ||
        _districtController.text.isNotEmpty;
  }

  // --- ADVANCED PARSING (The "High Accuracy" Part) ---

  String _normalizeText(String text) {
    // 1. Convert Persian/Arabic digits to English
    const persianDigits = '۰۱۲۳۴۵۶۷۸۹';
    const arabicDigits = '٠١٢٣٤٥٦٧٨٩';
    const englishDigits = '0123456789';

    String result = text;
    for (int i = 0; i < 10; i++) {
      result = result.replaceAll(persianDigits[i], englishDigits[i]);
      result = result.replaceAll(arabicDigits[i], englishDigits[i]);
    }

    // 2. Normalize Characters
    result = result.replaceAll('ي', 'ی').replaceAll('ك', 'ک');

    // 3. Convert Persian Text Numbers to Digits (Common for bedrooms/floors)
    Map<String, String> wordToNum = {
      'یک': '1',
      'یه': '1',
      'دو': '2',
      'سه': '3',
      'چهار': '4',
      'پنج': '5',
      'شش': '6',
      'شیش': '6',
      'هفت': '7',
      'هشت': '8',
      'نه': '9',
      'ده': '10',
      'یازده': '11',
      'دوازده': '12',
    };

    wordToNum.forEach((word, num) {
      result = result.replaceAll(
        RegExp(r'(?<=^|\s)' + word + r'(?=\s|$)'),
        num,
      );
      result = result.replaceAll(
        RegExp(r'(?<=^|\s)' + word + r'(?=\s*(خواب|اتاق|طبقه|ساله))'),
        num,
      );
    });

    return result;
  }

  String _extractPropertyDetails(String rawText) {
    String text = _normalizeText(rawText);
    String summary = "";

    // 1. Type
    if (text.contains('آپارتمان') || text.contains('اپارتمان')) {
      _propertyType = 'آپارتمان';
      summary += "✅ نوع: آپارتمان\n";
    } else if (text.contains('ویلا') || text.contains('ویلایی')) {
      _propertyType = 'ویلا';
      summary += "✅ نوع: ویلا\n";
    } else if (text.contains('مغازه') || text.contains('تجاری')) {
      _propertyType = 'مغازه';
      summary += "✅ نوع: مغازه\n";
    } else if (text.contains('زمین') || text.contains('کلنگی')) {
      _propertyType = 'زمین';
      summary += "✅ نوع: زمین\n";
    } else if (text.contains('اداری') || text.contains('دفتر')) {
      _propertyType = 'اداری';
      summary += "✅ نوع: اداری\n";
    }

    // 2. Transaction Type
    if (text.contains('فروش') || text.contains('خرید')) {
      _transactionType = 'فروش';
      summary += "✅ معامله: فروش\n";
    } else if (text.contains('اجاره') || text.contains('رهن')) {
      _transactionType = 'اجاره';
      summary += "✅ معامله: اجاره\n";
    }

    // 3. Area (Metraj)
    final areaRegex = RegExp(r'(\d+)\s*(?:متر|متری|متراژ|متر مربع)');
    final areaMatch = areaRegex.firstMatch(text);
    if (areaMatch != null) {
      _areaController.text = areaMatch.group(1)!;
      summary += "✅ متراژ: ${areaMatch.group(1)} متر\n";
    }

    // 4. Price (Gheymat)
    final billionRegex = RegExp(r'(\d+(?:\.\d+)?)\s*(?:میلیارد|ملیارد)');
    final billionMatch = billionRegex.firstMatch(text);
    if (billionMatch != null) {
      double val = double.parse(billionMatch.group(1)!);
      int price = (val * 1000000000).round();
      _priceController.text = price.toString();
      summary += "✅ قیمت: $val میلیارد تومان\n";
    } else {
      final millionRegex = RegExp(r'(\d+)\s*(?:میلیون|میل)');
      final millionMatch = millionRegex.firstMatch(text);
      if (millionMatch != null) {
        int val = int.parse(millionMatch.group(1)!);
        int price = val * 1000000;
        _priceController.text = price.toString();
        summary += "✅ قیمت: $val میلیون تومان\n";
      } else {
        final tomanRegex = RegExp(r'(\d+)\s*(?:تومان|تومن)');
        final tomanMatch = tomanRegex.firstMatch(text);
        if (tomanMatch != null) {
          _priceController.text = tomanMatch.group(1)!;
          summary += "✅ قیمت: ${tomanMatch.group(1)} تومان\n";
        }
      }
    }

    // 5. Bedrooms
    final bedRegex = RegExp(r'(\d+)\s*(?:خواب|خوابه|اتاق)');
    final bedMatch = bedRegex.firstMatch(text);
    if (bedMatch != null) {
      _bedroomsController.text = bedMatch.group(1)!;
      summary += "✅ خواب: ${bedMatch.group(1)}\n";
    }

    // 6. Year Built (Sal Sakht)
    final yearRegex = RegExp(r'(?:سال|سال ساخت|ساخت)\s*:?\s*(\d{4})');
    final yearMatch = yearRegex.firstMatch(text);
    if (yearMatch != null) {
      _yearBuiltController.text = yearMatch.group(1)!;
      summary += "✅ سال ساخت: ${yearMatch.group(1)}\n";
    }

    // 7. Location (District/City)
    for (String district in _knownDistricts) {
      if (text.contains(district)) {
        _districtController.text = district;
        _cityController.text = 'تهران';
        summary += "✅ محله: $district\n";
        break;
      }
    }
    if (_districtController.text.isEmpty && text.contains('تهران')) {
      _cityController.text = 'تهران';
      summary += "✅ شهر: تهران\n";
    }

    // 8. Facilities (Keywords)
    if (text.contains('پارکینگ')) {
      _hasParking = true;
      summary += "✅ پارکینگ دارد\n";
    }
    if (text.contains('آسانسور')) {
      _hasElevator = true;
      summary += "✅ آسانسور دارد\n";
    }
    if (text.contains('انباری')) {
      _hasStorage = true;
      summary += "✅ انباری دارد\n";
    }
    if (text.contains('بازسازی')) {
      _isRenovated = true;
      summary += "✅ بازسازی شده\n";
    }
    if (text.contains('معاوضه') || text.contains('تعویض')) {
      _openToExchange = true;
      summary += "✅ مایل به معاوضه\n";
    }

    // 9. Update Description
    if (_descriptionController.text.isEmpty) {
      _descriptionController.text = rawText;
    } else {
      _descriptionController.text += "\n$rawText";
    }

    return summary;
  }

  // --- Standard Form Steps (Same as before) ---
  Step _buildBasicInfoStep() {
    return Step(
      title: Text('اطلاعات اصلی', textDirection: TextDirection.rtl),
      content: Form(
        key: _basicFormKey,
        child: Column(
          children: [
            _buildTextField(
              _titleController,
              'عنوان آگهی',
              Icons.title,
              'مثال: آپارتمان لوکس در ولنجک',
            ),
            SizedBox(height: 12),
            _buildDropdown(
              'نوع ملک',
              _propertyType,
              _propertyTypes,
              (val) => setState(() => _propertyType = val),
            ),
            SizedBox(height: 12),
            _buildDropdown(
              'نوع معامله',
              _transactionType,
              _transactionTypes,
              (val) => setState(() => _transactionType = val),
            ),
            SizedBox(height: 12),
            _buildTextField(
              _priceController,
              'قیمت (تومان)',
              Icons.attach_money,
              'مثال: ۵۰۰۰۰۰۰۰۰۰',
              isNumber: true,
            ),
            SizedBox(height: 12),
            _buildTextField(
              _areaController,
              'متراژ (متر)',
              Icons.square_foot,
              'مثال: ۱۲۰',
              isNumber: true,
            ),
          ],
        ),
      ),
      isActive: _currentStep >= 0,
    );
  }

  Step _buildLocationStep() {
    return Step(
      title: Text('موقعیت', textDirection: TextDirection.rtl),
      content: Form(
        key: _locationFormKey,
        child: Column(
          children: [
            _buildTextField(
              _cityController,
              'شهر',
              Icons.location_city,
              'مثال: تهران',
            ),
            SizedBox(height: 12),
            _buildTextField(
              _districtController,
              'محله',
              Icons.map,
              'مثال: ولنجک',
            ),
          ],
        ),
      ),
      isActive: _currentStep >= 1,
    );
  }

  Step _buildDetailsStep() {
    return Step(
      title: Text('جزئیات', textDirection: TextDirection.rtl),
      content: Form(
        key: _detailsFormKey,
        child: Column(
          children: [
            _buildTextField(
              _bedroomsController,
              'تعداد اتاق',
              Icons.bed,
              'مثال: ۲',
              isNumber: true,
            ),
            SizedBox(height: 12),
            _buildTextField(
              _yearBuiltController,
              'سال ساخت',
              Icons.calendar_today,
              'مثال: ۱۴۰۰',
              isNumber: true,
            ),
            SizedBox(height: 12),
            _buildTextField(
              _floorController,
              'طبقه',
              Icons.layers,
              'مثال: ۳',
              isNumber: true,
            ),
            SizedBox(height: 12),
            _buildTextField(
              _totalFloorsController,
              'تعداد کل طبقات',
              Icons.format_list_numbered,
              'مثال: ۵',
              isNumber: true,
            ),
            SizedBox(height: 12),
            _buildDropdown(
              'نوع سند',
              _documentType,
              _documentTypes,
              (val) => setState(() => _documentType = val),
            ),
          ],
        ),
      ),
      isActive: _currentStep >= 2,
    );
  }

  Step _buildFacilitiesStep() {
    return Step(
      title: Text('امکانات', textDirection: TextDirection.rtl),
      content: Form(
        key: _facilitiesFormKey,
        child: Column(
          children: [
            _buildCheckbox(
              'پارکینگ',
              _hasParking,
              (val) => setState(() => _hasParking = val!),
            ),
            _buildCheckbox(
              'آسانسور',
              _hasElevator,
              (val) => setState(() => _hasElevator = val!),
            ),
            _buildCheckbox(
              'انباری',
              _hasStorage,
              (val) => setState(() => _hasStorage = val!),
            ),
            _buildCheckbox(
              'بازسازی شده',
              _isRenovated,
              (val) => setState(() => _isRenovated = val!),
            ),
            Divider(),
            _buildCheckbox(
              'مایل به معاوضه',
              _openToExchange,
              (val) => setState(() => _openToExchange = val!),
            ),
            if (_openToExchange)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: _buildTextField(
                  _exchangePreferencesController,
                  'شرح معاوضه',
                  Icons.swap_horiz,
                  'مثال: با آپارتمان کوچکتر در منطقه X',
                ),
              ),
            SizedBox(height: 12),
            _buildTextField(
              _descriptionController,
              'توضیحات تکمیلی',
              Icons.description,
              '...',
            ),
          ],
        ),
      ),
      isActive: _currentStep >= 3,
    );
  }

  Step _buildContactStep() {
    return Step(
      title: Text('اطلاعات تماس', textDirection: TextDirection.rtl),
      content: Form(
        key: _contactFormKey,
        child: Column(
          children: [
            _buildTextField(
              _phoneController,
              'شماره تماس',
              Icons.phone,
              '۰۹۱۲...',
            ),
          ],
        ),
      ),
      isActive: _currentStep >= 4,
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    IconData icon,
    String hint, {
    bool isNumber = false,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      validator: (value) =>
          value == null || value.isEmpty ? 'این فیلد الزامی است' : null,
    );
  }

  Widget _buildDropdown(
    String label,
    String? value,
    List<String> items,
    ValueChanged<String?> onChanged,
  ) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      ),
      items: items
          .map((item) => DropdownMenuItem(value: item, child: Text(item)))
          .toList(),
      onChanged: onChanged,
    );
  }

  Widget _buildCheckbox(
    String title,
    bool value,
    ValueChanged<bool?> onChanged,
  ) {
    return CheckboxListTile(
      title: Text(title, textDirection: TextDirection.rtl),
      value: value,
      onChanged: onChanged,
      activeColor: AppTheme.primaryColor,
    );
  }

  Widget _buildControls(BuildContext context, ControlsDetails details) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        children: [
          if (_currentStep > 0)
            Expanded(
              child: OutlinedButton(
                onPressed: details.onStepCancel,
                child: Text('قبلی'),
              ),
            ),
          if (_currentStep > 0) SizedBox(width: 12),
          Expanded(
            child: ElevatedButton(
              onPressed: _isSubmitting ? null : details.onStepContinue,
              child: _isSubmitting
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Text(_currentStep == 4 ? 'ثبت نهایی' : 'بعدی'),
            ),
          ),
        ],
      ),
    );
  }

  void _onStepContinue() {
    if (_currentStep == 0) {
      if (_basicFormKey.currentState!.validate()) {
        setState(() => _currentStep++);
      }
    } else if (_currentStep == 1) {
      if (_locationFormKey.currentState!.validate()) {
        setState(() => _currentStep++);
      }
    } else if (_currentStep == 2) {
      if (_detailsFormKey.currentState!.validate()) {
        setState(() => _currentStep++);
      }
    } else if (_currentStep == 3) {
      if (_facilitiesFormKey.currentState!.validate()) {
        setState(() => _currentStep++);
      }
    } else if (_currentStep == 4) {
      if (_contactFormKey.currentState!.validate()) {
        _submitProperty();
      }
    }
  }

  void _onStepCancel() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
    }
  }

  Future<void> _submitProperty() async {
    setState(() => _isSubmitting = true);

    try {
      // change text to list for exchanges
      List<String> exchangeList = [];
      if (_openToExchange && _exchangePreferencesController.text.isNotEmpty) {
        exchangeList = _exchangePreferencesController.text
            .split(RegExp(r'[,،\n]')) 
            .map((e) => e.trim())
            .where((e) => e.isNotEmpty)
            .toList();
      }

      // data need to send it to db
      final propertyData = {
        "title": _titleController.text,
        "description": _descriptionController.text.isNotEmpty
            ? _descriptionController.text
            : "توضیحات ندارد",
        "property_type": _propertyType ?? "نامشخص",
        "transaction_type": _transactionType ?? "نامشخص",
        "price": int.tryParse(_priceController.text) ?? 0,
        "area": int.tryParse(_areaController.text) ?? 0,
        "city": _cityController.text,
        "district": _districtController.text,
        "bedrooms": int.tryParse(_bedroomsController.text) ?? 0,
        "owner_phone": _phoneController.text,
        "year_built": int.tryParse(_yearBuiltController.text) ?? 0,
        "has_parking": _hasParking,
        "has_elevator": _hasElevator,
        "has_storage": _hasStorage,
        "open_to_exchange": _openToExchange,
        "exchange_preferences": exchangeList,
      };

      print('-----------------------------');
      print('Submitting Property to /properties/submit');
      print('Payload: ${json.encode(propertyData)}');
      print('-----------------------------');

      // send to api.
      final response = await _apiService.submitProperty(propertyData);

      print('Server Response: $response');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'آگهی با موفقیت ثبت شد!',
            textDirection: TextDirection.rtl,
          ),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context);
    } catch (e) {
      print('Error submitting property: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('خطا در ثبت آگهی: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }
}
