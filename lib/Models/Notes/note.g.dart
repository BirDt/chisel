// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetNoteCollection on Isar {
  IsarCollection<Note> get notes => this.collection();
}

const NoteSchema = CollectionSchema(
  name: r'Note',
  id: 6284318083599466921,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'internalContent': PropertySchema(
      id: 1,
      name: r'internalContent',
      type: IsarType.string,
    ),
    r'lastEditedAt': PropertySchema(
      id: 2,
      name: r'lastEditedAt',
      type: IsarType.dateTime,
    ),
    r'parentId': PropertySchema(
      id: 3,
      name: r'parentId',
      type: IsarType.long,
    ),
    r'parentType': PropertySchema(
      id: 4,
      name: r'parentType',
      type: IsarType.long,
    )
  },
  estimateSize: _noteEstimateSize,
  serialize: _noteSerialize,
  deserialize: _noteDeserialize,
  deserializeProp: _noteDeserializeProp,
  idName: r'id',
  indexes: {
    r'parentId_parentType': IndexSchema(
      id: -8588116948255114464,
      name: r'parentId_parentType',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'parentId',
          type: IndexType.value,
          caseSensitive: false,
        ),
        IndexPropertySchema(
          name: r'parentType',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _noteGetId,
  getLinks: _noteGetLinks,
  attach: _noteAttach,
  version: '3.1.8',
);

int _noteEstimateSize(
  Note object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.internalContent.length * 3;
  return bytesCount;
}

void _noteSerialize(
  Note object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.internalContent);
  writer.writeDateTime(offsets[2], object.lastEditedAt);
  writer.writeLong(offsets[3], object.parentId);
  writer.writeLong(offsets[4], object.parentType);
}

Note _noteDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Note(
    createdAt: reader.readDateTime(offsets[0]),
    internalContent: reader.readString(offsets[1]),
    lastEditedAt: reader.readDateTime(offsets[2]),
    parentId: reader.readLongOrNull(offsets[3]),
    parentType: reader.readLongOrNull(offsets[4]),
  );
  object.id = id;
  return object;
}

P _noteDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _noteGetId(Note object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _noteGetLinks(Note object) {
  return [];
}

void _noteAttach(IsarCollection<dynamic> col, Id id, Note object) {
  object.id = id;
}

extension NoteQueryWhereSort on QueryBuilder<Note, Note, QWhere> {
  QueryBuilder<Note, Note, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Note, Note, QAfterWhere> anyParentIdParentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'parentId_parentType'),
      );
    });
  }
}

extension NoteQueryWhere on QueryBuilder<Note, Note, QWhereClause> {
  QueryBuilder<Note, Note, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Note, Note, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Note, Note, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Note, Note, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterWhereClause> parentIdIsNullAnyParentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'parentId_parentType',
        value: [null],
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterWhereClause> parentIdIsNotNullAnyParentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'parentId_parentType',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterWhereClause> parentIdEqualToAnyParentType(
      int? parentId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'parentId_parentType',
        value: [parentId],
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterWhereClause> parentIdNotEqualToAnyParentType(
      int? parentId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'parentId_parentType',
              lower: [],
              upper: [parentId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'parentId_parentType',
              lower: [parentId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'parentId_parentType',
              lower: [parentId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'parentId_parentType',
              lower: [],
              upper: [parentId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Note, Note, QAfterWhereClause> parentIdGreaterThanAnyParentType(
    int? parentId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'parentId_parentType',
        lower: [parentId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterWhereClause> parentIdLessThanAnyParentType(
    int? parentId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'parentId_parentType',
        lower: [],
        upper: [parentId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterWhereClause> parentIdBetweenAnyParentType(
    int? lowerParentId,
    int? upperParentId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'parentId_parentType',
        lower: [lowerParentId],
        includeLower: includeLower,
        upper: [upperParentId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterWhereClause> parentIdEqualToParentTypeIsNull(
      int? parentId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'parentId_parentType',
        value: [parentId, null],
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterWhereClause>
      parentIdEqualToParentTypeIsNotNull(int? parentId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'parentId_parentType',
        lower: [parentId, null],
        includeLower: false,
        upper: [
          parentId,
        ],
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterWhereClause> parentIdParentTypeEqualTo(
      int? parentId, int? parentType) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'parentId_parentType',
        value: [parentId, parentType],
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterWhereClause>
      parentIdEqualToParentTypeNotEqualTo(int? parentId, int? parentType) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'parentId_parentType',
              lower: [parentId],
              upper: [parentId, parentType],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'parentId_parentType',
              lower: [parentId, parentType],
              includeLower: false,
              upper: [parentId],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'parentId_parentType',
              lower: [parentId, parentType],
              includeLower: false,
              upper: [parentId],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'parentId_parentType',
              lower: [parentId],
              upper: [parentId, parentType],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Note, Note, QAfterWhereClause>
      parentIdEqualToParentTypeGreaterThan(
    int? parentId,
    int? parentType, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'parentId_parentType',
        lower: [parentId, parentType],
        includeLower: include,
        upper: [parentId],
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterWhereClause> parentIdEqualToParentTypeLessThan(
    int? parentId,
    int? parentType, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'parentId_parentType',
        lower: [parentId],
        upper: [parentId, parentType],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterWhereClause> parentIdEqualToParentTypeBetween(
    int? parentId,
    int? lowerParentType,
    int? upperParentType, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'parentId_parentType',
        lower: [parentId, lowerParentType],
        includeLower: includeLower,
        upper: [parentId, upperParentType],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NoteQueryFilter on QueryBuilder<Note, Note, QFilterCondition> {
  QueryBuilder<Note, Note, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterFilterCondition> createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterFilterCondition> internalContentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'internalContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterFilterCondition> internalContentGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'internalContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterFilterCondition> internalContentLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'internalContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterFilterCondition> internalContentBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'internalContent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterFilterCondition> internalContentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'internalContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterFilterCondition> internalContentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'internalContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterFilterCondition> internalContentContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'internalContent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterFilterCondition> internalContentMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'internalContent',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterFilterCondition> internalContentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'internalContent',
        value: '',
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterFilterCondition> internalContentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'internalContent',
        value: '',
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterFilterCondition> lastEditedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastEditedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterFilterCondition> lastEditedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastEditedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterFilterCondition> lastEditedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastEditedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterFilterCondition> lastEditedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastEditedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterFilterCondition> parentIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'parentId',
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterFilterCondition> parentIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'parentId',
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterFilterCondition> parentIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentId',
        value: value,
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterFilterCondition> parentIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parentId',
        value: value,
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterFilterCondition> parentIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parentId',
        value: value,
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterFilterCondition> parentIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parentId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterFilterCondition> parentTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'parentType',
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterFilterCondition> parentTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'parentType',
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterFilterCondition> parentTypeEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parentType',
        value: value,
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterFilterCondition> parentTypeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parentType',
        value: value,
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterFilterCondition> parentTypeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parentType',
        value: value,
      ));
    });
  }

  QueryBuilder<Note, Note, QAfterFilterCondition> parentTypeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parentType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension NoteQueryObject on QueryBuilder<Note, Note, QFilterCondition> {}

extension NoteQueryLinks on QueryBuilder<Note, Note, QFilterCondition> {}

extension NoteQuerySortBy on QueryBuilder<Note, Note, QSortBy> {
  QueryBuilder<Note, Note, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Note, Note, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Note, Note, QAfterSortBy> sortByInternalContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'internalContent', Sort.asc);
    });
  }

  QueryBuilder<Note, Note, QAfterSortBy> sortByInternalContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'internalContent', Sort.desc);
    });
  }

  QueryBuilder<Note, Note, QAfterSortBy> sortByLastEditedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastEditedAt', Sort.asc);
    });
  }

  QueryBuilder<Note, Note, QAfterSortBy> sortByLastEditedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastEditedAt', Sort.desc);
    });
  }

  QueryBuilder<Note, Note, QAfterSortBy> sortByParentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentId', Sort.asc);
    });
  }

  QueryBuilder<Note, Note, QAfterSortBy> sortByParentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentId', Sort.desc);
    });
  }

  QueryBuilder<Note, Note, QAfterSortBy> sortByParentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentType', Sort.asc);
    });
  }

  QueryBuilder<Note, Note, QAfterSortBy> sortByParentTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentType', Sort.desc);
    });
  }
}

extension NoteQuerySortThenBy on QueryBuilder<Note, Note, QSortThenBy> {
  QueryBuilder<Note, Note, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Note, Note, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Note, Note, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Note, Note, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Note, Note, QAfterSortBy> thenByInternalContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'internalContent', Sort.asc);
    });
  }

  QueryBuilder<Note, Note, QAfterSortBy> thenByInternalContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'internalContent', Sort.desc);
    });
  }

  QueryBuilder<Note, Note, QAfterSortBy> thenByLastEditedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastEditedAt', Sort.asc);
    });
  }

  QueryBuilder<Note, Note, QAfterSortBy> thenByLastEditedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastEditedAt', Sort.desc);
    });
  }

  QueryBuilder<Note, Note, QAfterSortBy> thenByParentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentId', Sort.asc);
    });
  }

  QueryBuilder<Note, Note, QAfterSortBy> thenByParentIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentId', Sort.desc);
    });
  }

  QueryBuilder<Note, Note, QAfterSortBy> thenByParentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentType', Sort.asc);
    });
  }

  QueryBuilder<Note, Note, QAfterSortBy> thenByParentTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentType', Sort.desc);
    });
  }
}

extension NoteQueryWhereDistinct on QueryBuilder<Note, Note, QDistinct> {
  QueryBuilder<Note, Note, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Note, Note, QDistinct> distinctByInternalContent(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'internalContent',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Note, Note, QDistinct> distinctByLastEditedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastEditedAt');
    });
  }

  QueryBuilder<Note, Note, QDistinct> distinctByParentId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parentId');
    });
  }

  QueryBuilder<Note, Note, QDistinct> distinctByParentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parentType');
    });
  }
}

extension NoteQueryProperty on QueryBuilder<Note, Note, QQueryProperty> {
  QueryBuilder<Note, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Note, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Note, String, QQueryOperations> internalContentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'internalContent');
    });
  }

  QueryBuilder<Note, DateTime, QQueryOperations> lastEditedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastEditedAt');
    });
  }

  QueryBuilder<Note, int?, QQueryOperations> parentIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parentId');
    });
  }

  QueryBuilder<Note, int?, QQueryOperations> parentTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parentType');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Note _$NoteFromJson(Map<String, dynamic> json) => Note(
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastEditedAt: DateTime.parse(json['lastEditedAt'] as String),
      internalContent: json['internalContent'] as String,
      parentId: (json['parentId'] as num?)?.toInt(),
      parentType: (json['parentType'] as num?)?.toInt(),
    );

Map<String, dynamic> _$NoteToJson(Note instance) => <String, dynamic>{
      'internalContent': instance.internalContent,
      'createdAt': instance.createdAt.toIso8601String(),
      'lastEditedAt': instance.lastEditedAt.toIso8601String(),
      'parentId': instance.parentId,
      'parentType': instance.parentType,
    };
