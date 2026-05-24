// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$favoritesLocalDataSourceHash() =>
    r'c15b3c5f5bebf8532a207aea7a3213072b727308';

/// See also [favoritesLocalDataSource].
@ProviderFor(favoritesLocalDataSource)
final favoritesLocalDataSourceProvider =
    AutoDisposeProvider<FavoritesLocalDataSource>.internal(
  favoritesLocalDataSource,
  name: r'favoritesLocalDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoritesLocalDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FavoritesLocalDataSourceRef
    = AutoDisposeProviderRef<FavoritesLocalDataSource>;
String _$favoritesRepositoryHash() =>
    r'a9e45dd8c81f43d2dfcad6744f7fef515bee3ea3';

/// See also [favoritesRepository].
@ProviderFor(favoritesRepository)
final favoritesRepositoryProvider =
    AutoDisposeProvider<FavoritesRepository>.internal(
  favoritesRepository,
  name: r'favoritesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoritesRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FavoritesRepositoryRef = AutoDisposeProviderRef<FavoritesRepository>;
String _$isFavoriteHash() => r'7abd76ded63709c6572ee9255fe37022de6b8a9a';

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

/// Helper provider: kiểm tra nhanh một slang có trong favorites không
///
/// Copied from [isFavorite].
@ProviderFor(isFavorite)
const isFavoriteProvider = IsFavoriteFamily();

/// Helper provider: kiểm tra nhanh một slang có trong favorites không
///
/// Copied from [isFavorite].
class IsFavoriteFamily extends Family<bool> {
  /// Helper provider: kiểm tra nhanh một slang có trong favorites không
  ///
  /// Copied from [isFavorite].
  const IsFavoriteFamily();

  /// Helper provider: kiểm tra nhanh một slang có trong favorites không
  ///
  /// Copied from [isFavorite].
  IsFavoriteProvider call(
    String slangId,
  ) {
    return IsFavoriteProvider(
      slangId,
    );
  }

  @override
  IsFavoriteProvider getProviderOverride(
    covariant IsFavoriteProvider provider,
  ) {
    return call(
      provider.slangId,
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
  String? get name => r'isFavoriteProvider';
}

/// Helper provider: kiểm tra nhanh một slang có trong favorites không
///
/// Copied from [isFavorite].
class IsFavoriteProvider extends AutoDisposeProvider<bool> {
  /// Helper provider: kiểm tra nhanh một slang có trong favorites không
  ///
  /// Copied from [isFavorite].
  IsFavoriteProvider(
    String slangId,
  ) : this._internal(
          (ref) => isFavorite(
            ref as IsFavoriteRef,
            slangId,
          ),
          from: isFavoriteProvider,
          name: r'isFavoriteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isFavoriteHash,
          dependencies: IsFavoriteFamily._dependencies,
          allTransitiveDependencies:
              IsFavoriteFamily._allTransitiveDependencies,
          slangId: slangId,
        );

  IsFavoriteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.slangId,
  }) : super.internal();

  final String slangId;

  @override
  Override overrideWith(
    bool Function(IsFavoriteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IsFavoriteProvider._internal(
        (ref) => create(ref as IsFavoriteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        slangId: slangId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<bool> createElement() {
    return _IsFavoriteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsFavoriteProvider && other.slangId == slangId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, slangId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin IsFavoriteRef on AutoDisposeProviderRef<bool> {
  /// The parameter `slangId` of this provider.
  String get slangId;
}

class _IsFavoriteProviderElement extends AutoDisposeProviderElement<bool>
    with IsFavoriteRef {
  _IsFavoriteProviderElement(super.provider);

  @override
  String get slangId => (origin as IsFavoriteProvider).slangId;
}

String _$favoritesNotifierHash() => r'8fe3a11575a4a50faa8d4945a1d619e740bcc4f3';

/// AsyncNotifier quản lý danh sách favorites IDs
/// UI dùng provider này để toggle và check
///
/// Copied from [FavoritesNotifier].
@ProviderFor(FavoritesNotifier)
final favoritesNotifierProvider =
    AutoDisposeAsyncNotifierProvider<FavoritesNotifier, Set<String>>.internal(
  FavoritesNotifier.new,
  name: r'favoritesNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoritesNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FavoritesNotifier = AutoDisposeAsyncNotifier<Set<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
