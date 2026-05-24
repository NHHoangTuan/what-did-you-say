// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slang_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$slangAssetDataSourceHash() =>
    r'410d75252b2805ca3a3d5d956803b6d09df5138c';

/// See also [slangAssetDataSource].
@ProviderFor(slangAssetDataSource)
final slangAssetDataSourceProvider =
    AutoDisposeProvider<SlangAssetDataSource>.internal(
  slangAssetDataSource,
  name: r'slangAssetDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$slangAssetDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SlangAssetDataSourceRef = AutoDisposeProviderRef<SlangAssetDataSource>;
String _$slangRepositoryHash() => r'0e695e20ff4ea4e582b61ce2acd7fdeb3c5c1357';

/// See also [slangRepository].
@ProviderFor(slangRepository)
final slangRepositoryProvider = AutoDisposeProvider<SlangRepository>.internal(
  slangRepository,
  name: r'slangRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$slangRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SlangRepositoryRef = AutoDisposeProviderRef<SlangRepository>;
String _$searchSlangsUseCaseHash() =>
    r'b30ed25d02d358f7d5b78eb244ca29f1bd364620';

/// See also [searchSlangsUseCase].
@ProviderFor(searchSlangsUseCase)
final searchSlangsUseCaseProvider =
    AutoDisposeProvider<SearchSlangsUseCase>.internal(
  searchSlangsUseCase,
  name: r'searchSlangsUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchSlangsUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SearchSlangsUseCaseRef = AutoDisposeProviderRef<SearchSlangsUseCase>;
String _$getSlangByIdUseCaseHash() =>
    r'e43d47ace896c411ec5bf9b6f8f3ec46db80a15c';

/// See also [getSlangByIdUseCase].
@ProviderFor(getSlangByIdUseCase)
final getSlangByIdUseCaseProvider =
    AutoDisposeProvider<GetSlangByIdUseCase>.internal(
  getSlangByIdUseCase,
  name: r'getSlangByIdUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getSlangByIdUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetSlangByIdUseCaseRef = AutoDisposeProviderRef<GetSlangByIdUseCase>;
String _$getTrendingUseCaseHash() =>
    r'a5fb9f85d837971ef6aa15ae33f28a8de6e16aa8';

/// See also [getTrendingUseCase].
@ProviderFor(getTrendingUseCase)
final getTrendingUseCaseProvider =
    AutoDisposeProvider<GetTrendingUseCase>.internal(
  getTrendingUseCase,
  name: r'getTrendingUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getTrendingUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetTrendingUseCaseRef = AutoDisposeProviderRef<GetTrendingUseCase>;
String _$getSlangOfDayUseCaseHash() =>
    r'7bc2a03942e974036a1fe902d81fe684bc47b1f8';

/// See also [getSlangOfDayUseCase].
@ProviderFor(getSlangOfDayUseCase)
final getSlangOfDayUseCaseProvider =
    AutoDisposeProvider<GetSlangOfDayUseCase>.internal(
  getSlangOfDayUseCase,
  name: r'getSlangOfDayUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getSlangOfDayUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetSlangOfDayUseCaseRef = AutoDisposeProviderRef<GetSlangOfDayUseCase>;
String _$trendingSlangsHash() => r'd53bf4f35f6d6a5642045bc4a82ebad40df6e4d9';

/// Danh sách slang trending — FutureProvider, cache tự động
///
/// Copied from [trendingSlangs].
@ProviderFor(trendingSlangs)
final trendingSlangsProvider =
    AutoDisposeFutureProvider<List<SlangEntity>>.internal(
  trendingSlangs,
  name: r'trendingSlangsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$trendingSlangsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TrendingSlangsRef = AutoDisposeFutureProviderRef<List<SlangEntity>>;
String _$slangOfDayHash() => r'751d5a45da7fa92a740a15fee52ac5cbe070841a';

/// Slang of the day — thay đổi mỗi ngày
///
/// Copied from [slangOfDay].
@ProviderFor(slangOfDay)
final slangOfDayProvider = AutoDisposeFutureProvider<SlangEntity>.internal(
  slangOfDay,
  name: r'slangOfDayProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$slangOfDayHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SlangOfDayRef = AutoDisposeFutureProviderRef<SlangEntity>;
String _$slangSearchHash() => r'381460227b76f722c26dd21e74a196f925e000f6';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Tìm kiếm theo query — family provider để pass tham số
///
/// Copied from [slangSearch].
@ProviderFor(slangSearch)
const slangSearchProvider = SlangSearchFamily();

/// Tìm kiếm theo query — family provider để pass tham số
///
/// Copied from [slangSearch].
class SlangSearchFamily extends Family<AsyncValue<List<SlangEntity>>> {
  /// Tìm kiếm theo query — family provider để pass tham số
  ///
  /// Copied from [slangSearch].
  const SlangSearchFamily();

  /// Tìm kiếm theo query — family provider để pass tham số
  ///
  /// Copied from [slangSearch].
  SlangSearchProvider call(
    String query,
  ) {
    return SlangSearchProvider(
      query,
    );
  }

  @override
  SlangSearchProvider getProviderOverride(
    covariant SlangSearchProvider provider,
  ) {
    return call(
      provider.query,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'slangSearchProvider';
}

/// Tìm kiếm theo query — family provider để pass tham số
///
/// Copied from [slangSearch].
class SlangSearchProvider extends AutoDisposeFutureProvider<List<SlangEntity>> {
  /// Tìm kiếm theo query — family provider để pass tham số
  ///
  /// Copied from [slangSearch].
  SlangSearchProvider(
    String query,
  ) : this._internal(
          (ref) => slangSearch(
            ref as SlangSearchRef,
            query,
          ),
          from: slangSearchProvider,
          name: r'slangSearchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$slangSearchHash,
          dependencies: SlangSearchFamily._dependencies,
          allTransitiveDependencies:
              SlangSearchFamily._allTransitiveDependencies,
          query: query,
        );

  SlangSearchProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  Override overrideWith(
    FutureOr<List<SlangEntity>> Function(SlangSearchRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SlangSearchProvider._internal(
        (ref) => create(ref as SlangSearchRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<SlangEntity>> createElement() {
    return _SlangSearchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SlangSearchProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SlangSearchRef on AutoDisposeFutureProviderRef<List<SlangEntity>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _SlangSearchProviderElement
    extends AutoDisposeFutureProviderElement<List<SlangEntity>>
    with SlangSearchRef {
  _SlangSearchProviderElement(super.provider);

  @override
  String get query => (origin as SlangSearchProvider).query;
}

String _$slangDetailHash() => r'b4e524c5a8027ec10d8a63b1b4ac55d4b2abb0f6';

/// Lấy chi tiết một slang — family provider
///
/// Copied from [slangDetail].
@ProviderFor(slangDetail)
const slangDetailProvider = SlangDetailFamily();

/// Lấy chi tiết một slang — family provider
///
/// Copied from [slangDetail].
class SlangDetailFamily extends Family<AsyncValue<SlangEntity?>> {
  /// Lấy chi tiết một slang — family provider
  ///
  /// Copied from [slangDetail].
  const SlangDetailFamily();

  /// Lấy chi tiết một slang — family provider
  ///
  /// Copied from [slangDetail].
  SlangDetailProvider call(
    String id,
  ) {
    return SlangDetailProvider(
      id,
    );
  }

  @override
  SlangDetailProvider getProviderOverride(
    covariant SlangDetailProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'slangDetailProvider';
}

/// Lấy chi tiết một slang — family provider
///
/// Copied from [slangDetail].
class SlangDetailProvider extends AutoDisposeFutureProvider<SlangEntity?> {
  /// Lấy chi tiết một slang — family provider
  ///
  /// Copied from [slangDetail].
  SlangDetailProvider(
    String id,
  ) : this._internal(
          (ref) => slangDetail(
            ref as SlangDetailRef,
            id,
          ),
          from: slangDetailProvider,
          name: r'slangDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$slangDetailHash,
          dependencies: SlangDetailFamily._dependencies,
          allTransitiveDependencies:
              SlangDetailFamily._allTransitiveDependencies,
          id: id,
        );

  SlangDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<SlangEntity?> Function(SlangDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SlangDetailProvider._internal(
        (ref) => create(ref as SlangDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<SlangEntity?> createElement() {
    return _SlangDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SlangDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SlangDetailRef on AutoDisposeFutureProviderRef<SlangEntity?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _SlangDetailProviderElement
    extends AutoDisposeFutureProviderElement<SlangEntity?> with SlangDetailRef {
  _SlangDetailProviderElement(super.provider);

  @override
  String get id => (origin as SlangDetailProvider).id;
}

String _$recentSearchesDataSourceHash() =>
    r'7cb56983fa152e5be94bd1fe1d83c126183292bc';

/// See also [recentSearchesDataSource].
@ProviderFor(recentSearchesDataSource)
final recentSearchesDataSourceProvider =
    AutoDisposeProvider<RecentSearchesDataSource>.internal(
  recentSearchesDataSource,
  name: r'recentSearchesDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$recentSearchesDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RecentSearchesDataSourceRef
    = AutoDisposeProviderRef<RecentSearchesDataSource>;
String _$recentSearchesHash() => r'acace7d868bbfb48e8d60cf37cfe771fd477a8fe';

/// Notifier quản lý lịch sử tìm kiếm
///
/// Copied from [RecentSearches].
@ProviderFor(RecentSearches)
final recentSearchesProvider =
    AutoDisposeNotifierProvider<RecentSearches, List<String>>.internal(
  RecentSearches.new,
  name: r'recentSearchesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$recentSearchesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RecentSearches = AutoDisposeNotifier<List<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
