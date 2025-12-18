import 'package:flutter/material.dart';
import '../models/models.dart';
import '../services/api_service.dart';
import '../config/theme.dart';
import '../widgets/property_card.dart';
import '../widgets/properties/property_sort_modal.dart';
import '../widgets/properties/property_empty_state.dart';

class PropertiesListScreen extends StatefulWidget {
  const PropertiesListScreen({Key? key}) : super(key: key);

  @override
  State<PropertiesListScreen> createState() => _PropertiesListScreenState();
}

class _PropertiesListScreenState extends State<PropertiesListScreen> {
  final ApiService _apiService = ApiService();
  List<Property> _properties = [];
  List<Property> _filteredProperties = [];
  bool _isLoading = true;
  String _searchQuery = '';
  String _sortBy = 'match'; // 'match', 'price', 'area'

  @override
  void initState() {
    super.initState();
    _loadProperties();
  }

  Future<void> _loadProperties() async {
    setState(() => _isLoading = true);

    try {
      final properties = await _apiService.getAllProperties();
      setState(() {
        _properties = properties;
        _filteredProperties = properties;
        _isLoading = false;
      });
      _applySort();
    } catch (e) {
      setState(() => _isLoading = false);
      _showError('خطا در بارگذاری املاک');
    }
  }

  void _applyFilter(String query) {
    setState(() {
      _searchQuery = query;
      if (query.isEmpty) {
        _filteredProperties = _properties;
      } else {
        _filteredProperties = _properties.where((property) {
          return property.title.contains(query) ||
              property.location.contains(query);
        }).toList();
      }
    });
    _applySort();
  }

  void _applySort() {
    setState(() {
      switch (_sortBy) {
        case 'price':
          _filteredProperties.sort((a, b) => a.price.compareTo(b.price));
          break;
        case 'area':
          _filteredProperties.sort((a, b) => b.area.compareTo(a.area));
          break;
        case 'match':
        default:
          _filteredProperties.sort(
            (a, b) => b.matchPercentage.compareTo(a.matchPercentage),
          );
      }
    });
  }

  void _showSortOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => PropertySortModal(
        currentSort: _sortBy,
        onSortSelected: (value) {
          setState(() => _sortBy = value);
          _applySort();
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
        ),
        backgroundColor: AppTheme.errorColor,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: Text(
          'لیست املاک',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          IconButton(icon: const Icon(Icons.sort), onPressed: _showSortOptions),
        ],
      ),
      body: Column(
        children: [
          // جستجو
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: 'جستجو در املاک...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => _applyFilter(''),
                      )
                    : null,
              ),
              onChanged: _applyFilter,
            ),
          ),

          // number of properties
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'تعداد: ${_filteredProperties.length} ملک',
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppTheme.textSecondary,
                  ),
                ),
                Text(
                  _getSortLabel(),
                  textDirection: TextDirection.rtl,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: AppTheme.textLight),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // لیست املاک
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _filteredProperties.isEmpty
                ? const PropertyEmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _filteredProperties.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: PropertyCard(
                          property: _filteredProperties[index],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  String _getSortLabel() {
    switch (_sortBy) {
      case 'price':
        return 'مرتب شده بر اساس قیمت';
      case 'area':
        return 'مرتب شده بر اساس متراژ';
      case 'match':
      default:
        return 'مرتب شده بر اساس تطابق';
    }
  }
}
