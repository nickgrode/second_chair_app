// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_helper.dart';

// ignore_for_file: type=lint
class $CasesTable extends Cases with TableInfo<$CasesTable, Case> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CasesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _clientIdMeta =
      const VerificationMeta('clientId');
  @override
  late final GeneratedColumn<int> clientId = GeneratedColumn<int>(
      'client_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _jurisdictionTypeMeta =
      const VerificationMeta('jurisdictionType');
  @override
  late final GeneratedColumn<String> jurisdictionType = GeneratedColumn<String>(
      'jurisdiction_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
      'state', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _countyMeta = const VerificationMeta('county');
  @override
  late final GeneratedColumn<String> county = GeneratedColumn<String>(
      'county', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _caseNumberMeta =
      const VerificationMeta('caseNumber');
  @override
  late final GeneratedColumn<String> caseNumber = GeneratedColumn<String>(
      'case_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _chargeMeta = const VerificationMeta('charge');
  @override
  late final GeneratedColumn<String> charge = GeneratedColumn<String>(
      'charge', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _assignedProsecutorMeta =
      const VerificationMeta('assignedProsecutor');
  @override
  late final GeneratedColumn<String> assignedProsecutor =
      GeneratedColumn<String>('assigned_prosecutor', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nextHearingTypeIdMeta =
      const VerificationMeta('nextHearingTypeId');
  @override
  late final GeneratedColumn<int> nextHearingTypeId = GeneratedColumn<int>(
      'next_hearing_type_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nextHearingMeta =
      const VerificationMeta('nextHearing');
  @override
  late final GeneratedColumn<DateTime> nextHearing = GeneratedColumn<DateTime>(
      'next_hearing', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        clientId,
        jurisdictionType,
        state,
        county,
        caseNumber,
        charge,
        assignedProsecutor,
        nextHearingTypeId,
        nextHearing
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cases';
  @override
  VerificationContext validateIntegrity(Insertable<Case> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('client_id')) {
      context.handle(_clientIdMeta,
          clientId.isAcceptableOrUnknown(data['client_id']!, _clientIdMeta));
    } else if (isInserting) {
      context.missing(_clientIdMeta);
    }
    if (data.containsKey('jurisdiction_type')) {
      context.handle(
          _jurisdictionTypeMeta,
          jurisdictionType.isAcceptableOrUnknown(
              data['jurisdiction_type']!, _jurisdictionTypeMeta));
    } else if (isInserting) {
      context.missing(_jurisdictionTypeMeta);
    }
    if (data.containsKey('state')) {
      context.handle(
          _stateMeta, state.isAcceptableOrUnknown(data['state']!, _stateMeta));
    }
    if (data.containsKey('county')) {
      context.handle(_countyMeta,
          county.isAcceptableOrUnknown(data['county']!, _countyMeta));
    }
    if (data.containsKey('case_number')) {
      context.handle(
          _caseNumberMeta,
          caseNumber.isAcceptableOrUnknown(
              data['case_number']!, _caseNumberMeta));
    } else if (isInserting) {
      context.missing(_caseNumberMeta);
    }
    if (data.containsKey('charge')) {
      context.handle(_chargeMeta,
          charge.isAcceptableOrUnknown(data['charge']!, _chargeMeta));
    } else if (isInserting) {
      context.missing(_chargeMeta);
    }
    if (data.containsKey('assigned_prosecutor')) {
      context.handle(
          _assignedProsecutorMeta,
          assignedProsecutor.isAcceptableOrUnknown(
              data['assigned_prosecutor']!, _assignedProsecutorMeta));
    }
    if (data.containsKey('next_hearing_type_id')) {
      context.handle(
          _nextHearingTypeIdMeta,
          nextHearingTypeId.isAcceptableOrUnknown(
              data['next_hearing_type_id']!, _nextHearingTypeIdMeta));
    } else if (isInserting) {
      context.missing(_nextHearingTypeIdMeta);
    }
    if (data.containsKey('next_hearing')) {
      context.handle(
          _nextHearingMeta,
          nextHearing.isAcceptableOrUnknown(
              data['next_hearing']!, _nextHearingMeta));
    } else if (isInserting) {
      context.missing(_nextHearingMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Case map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Case(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      clientId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}client_id'])!,
      jurisdictionType: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}jurisdiction_type'])!,
      state: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}state']),
      county: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}county']),
      caseNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}case_number'])!,
      charge: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}charge'])!,
      assignedProsecutor: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}assigned_prosecutor']),
      nextHearingTypeId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}next_hearing_type_id'])!,
      nextHearing: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}next_hearing'])!,
    );
  }

  @override
  $CasesTable createAlias(String alias) {
    return $CasesTable(attachedDatabase, alias);
  }
}

class Case extends DataClass implements Insertable<Case> {
  final int id;
  final int clientId;
  final String jurisdictionType;
  final String? state;
  final String? county;
  final String caseNumber;
  final String charge;
  final String? assignedProsecutor;
  final int nextHearingTypeId;
  final DateTime nextHearing;
  const Case(
      {required this.id,
      required this.clientId,
      required this.jurisdictionType,
      this.state,
      this.county,
      required this.caseNumber,
      required this.charge,
      this.assignedProsecutor,
      required this.nextHearingTypeId,
      required this.nextHearing});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['client_id'] = Variable<int>(clientId);
    map['jurisdiction_type'] = Variable<String>(jurisdictionType);
    if (!nullToAbsent || state != null) {
      map['state'] = Variable<String>(state);
    }
    if (!nullToAbsent || county != null) {
      map['county'] = Variable<String>(county);
    }
    map['case_number'] = Variable<String>(caseNumber);
    map['charge'] = Variable<String>(charge);
    if (!nullToAbsent || assignedProsecutor != null) {
      map['assigned_prosecutor'] = Variable<String>(assignedProsecutor);
    }
    map['next_hearing_type_id'] = Variable<int>(nextHearingTypeId);
    map['next_hearing'] = Variable<DateTime>(nextHearing);
    return map;
  }

  CasesCompanion toCompanion(bool nullToAbsent) {
    return CasesCompanion(
      id: Value(id),
      clientId: Value(clientId),
      jurisdictionType: Value(jurisdictionType),
      state:
          state == null && nullToAbsent ? const Value.absent() : Value(state),
      county:
          county == null && nullToAbsent ? const Value.absent() : Value(county),
      caseNumber: Value(caseNumber),
      charge: Value(charge),
      assignedProsecutor: assignedProsecutor == null && nullToAbsent
          ? const Value.absent()
          : Value(assignedProsecutor),
      nextHearingTypeId: Value(nextHearingTypeId),
      nextHearing: Value(nextHearing),
    );
  }

  factory Case.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Case(
      id: serializer.fromJson<int>(json['id']),
      clientId: serializer.fromJson<int>(json['clientId']),
      jurisdictionType: serializer.fromJson<String>(json['jurisdictionType']),
      state: serializer.fromJson<String?>(json['state']),
      county: serializer.fromJson<String?>(json['county']),
      caseNumber: serializer.fromJson<String>(json['caseNumber']),
      charge: serializer.fromJson<String>(json['charge']),
      assignedProsecutor:
          serializer.fromJson<String?>(json['assignedProsecutor']),
      nextHearingTypeId: serializer.fromJson<int>(json['nextHearingTypeId']),
      nextHearing: serializer.fromJson<DateTime>(json['nextHearing']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'clientId': serializer.toJson<int>(clientId),
      'jurisdictionType': serializer.toJson<String>(jurisdictionType),
      'state': serializer.toJson<String?>(state),
      'county': serializer.toJson<String?>(county),
      'caseNumber': serializer.toJson<String>(caseNumber),
      'charge': serializer.toJson<String>(charge),
      'assignedProsecutor': serializer.toJson<String?>(assignedProsecutor),
      'nextHearingTypeId': serializer.toJson<int>(nextHearingTypeId),
      'nextHearing': serializer.toJson<DateTime>(nextHearing),
    };
  }

  Case copyWith(
          {int? id,
          int? clientId,
          String? jurisdictionType,
          Value<String?> state = const Value.absent(),
          Value<String?> county = const Value.absent(),
          String? caseNumber,
          String? charge,
          Value<String?> assignedProsecutor = const Value.absent(),
          int? nextHearingTypeId,
          DateTime? nextHearing}) =>
      Case(
        id: id ?? this.id,
        clientId: clientId ?? this.clientId,
        jurisdictionType: jurisdictionType ?? this.jurisdictionType,
        state: state.present ? state.value : this.state,
        county: county.present ? county.value : this.county,
        caseNumber: caseNumber ?? this.caseNumber,
        charge: charge ?? this.charge,
        assignedProsecutor: assignedProsecutor.present
            ? assignedProsecutor.value
            : this.assignedProsecutor,
        nextHearingTypeId: nextHearingTypeId ?? this.nextHearingTypeId,
        nextHearing: nextHearing ?? this.nextHearing,
      );
  Case copyWithCompanion(CasesCompanion data) {
    return Case(
      id: data.id.present ? data.id.value : this.id,
      clientId: data.clientId.present ? data.clientId.value : this.clientId,
      jurisdictionType: data.jurisdictionType.present
          ? data.jurisdictionType.value
          : this.jurisdictionType,
      state: data.state.present ? data.state.value : this.state,
      county: data.county.present ? data.county.value : this.county,
      caseNumber:
          data.caseNumber.present ? data.caseNumber.value : this.caseNumber,
      charge: data.charge.present ? data.charge.value : this.charge,
      assignedProsecutor: data.assignedProsecutor.present
          ? data.assignedProsecutor.value
          : this.assignedProsecutor,
      nextHearingTypeId: data.nextHearingTypeId.present
          ? data.nextHearingTypeId.value
          : this.nextHearingTypeId,
      nextHearing:
          data.nextHearing.present ? data.nextHearing.value : this.nextHearing,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Case(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('jurisdictionType: $jurisdictionType, ')
          ..write('state: $state, ')
          ..write('county: $county, ')
          ..write('caseNumber: $caseNumber, ')
          ..write('charge: $charge, ')
          ..write('assignedProsecutor: $assignedProsecutor, ')
          ..write('nextHearingTypeId: $nextHearingTypeId, ')
          ..write('nextHearing: $nextHearing')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, clientId, jurisdictionType, state, county,
      caseNumber, charge, assignedProsecutor, nextHearingTypeId, nextHearing);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Case &&
          other.id == this.id &&
          other.clientId == this.clientId &&
          other.jurisdictionType == this.jurisdictionType &&
          other.state == this.state &&
          other.county == this.county &&
          other.caseNumber == this.caseNumber &&
          other.charge == this.charge &&
          other.assignedProsecutor == this.assignedProsecutor &&
          other.nextHearingTypeId == this.nextHearingTypeId &&
          other.nextHearing == this.nextHearing);
}

class CasesCompanion extends UpdateCompanion<Case> {
  final Value<int> id;
  final Value<int> clientId;
  final Value<String> jurisdictionType;
  final Value<String?> state;
  final Value<String?> county;
  final Value<String> caseNumber;
  final Value<String> charge;
  final Value<String?> assignedProsecutor;
  final Value<int> nextHearingTypeId;
  final Value<DateTime> nextHearing;
  const CasesCompanion({
    this.id = const Value.absent(),
    this.clientId = const Value.absent(),
    this.jurisdictionType = const Value.absent(),
    this.state = const Value.absent(),
    this.county = const Value.absent(),
    this.caseNumber = const Value.absent(),
    this.charge = const Value.absent(),
    this.assignedProsecutor = const Value.absent(),
    this.nextHearingTypeId = const Value.absent(),
    this.nextHearing = const Value.absent(),
  });
  CasesCompanion.insert({
    this.id = const Value.absent(),
    required int clientId,
    required String jurisdictionType,
    this.state = const Value.absent(),
    this.county = const Value.absent(),
    required String caseNumber,
    required String charge,
    this.assignedProsecutor = const Value.absent(),
    required int nextHearingTypeId,
    required DateTime nextHearing,
  })  : clientId = Value(clientId),
        jurisdictionType = Value(jurisdictionType),
        caseNumber = Value(caseNumber),
        charge = Value(charge),
        nextHearingTypeId = Value(nextHearingTypeId),
        nextHearing = Value(nextHearing);
  static Insertable<Case> custom({
    Expression<int>? id,
    Expression<int>? clientId,
    Expression<String>? jurisdictionType,
    Expression<String>? state,
    Expression<String>? county,
    Expression<String>? caseNumber,
    Expression<String>? charge,
    Expression<String>? assignedProsecutor,
    Expression<int>? nextHearingTypeId,
    Expression<DateTime>? nextHearing,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (clientId != null) 'client_id': clientId,
      if (jurisdictionType != null) 'jurisdiction_type': jurisdictionType,
      if (state != null) 'state': state,
      if (county != null) 'county': county,
      if (caseNumber != null) 'case_number': caseNumber,
      if (charge != null) 'charge': charge,
      if (assignedProsecutor != null) 'assigned_prosecutor': assignedProsecutor,
      if (nextHearingTypeId != null) 'next_hearing_type_id': nextHearingTypeId,
      if (nextHearing != null) 'next_hearing': nextHearing,
    });
  }

  CasesCompanion copyWith(
      {Value<int>? id,
      Value<int>? clientId,
      Value<String>? jurisdictionType,
      Value<String?>? state,
      Value<String?>? county,
      Value<String>? caseNumber,
      Value<String>? charge,
      Value<String?>? assignedProsecutor,
      Value<int>? nextHearingTypeId,
      Value<DateTime>? nextHearing}) {
    return CasesCompanion(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      jurisdictionType: jurisdictionType ?? this.jurisdictionType,
      state: state ?? this.state,
      county: county ?? this.county,
      caseNumber: caseNumber ?? this.caseNumber,
      charge: charge ?? this.charge,
      assignedProsecutor: assignedProsecutor ?? this.assignedProsecutor,
      nextHearingTypeId: nextHearingTypeId ?? this.nextHearingTypeId,
      nextHearing: nextHearing ?? this.nextHearing,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (clientId.present) {
      map['client_id'] = Variable<int>(clientId.value);
    }
    if (jurisdictionType.present) {
      map['jurisdiction_type'] = Variable<String>(jurisdictionType.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (county.present) {
      map['county'] = Variable<String>(county.value);
    }
    if (caseNumber.present) {
      map['case_number'] = Variable<String>(caseNumber.value);
    }
    if (charge.present) {
      map['charge'] = Variable<String>(charge.value);
    }
    if (assignedProsecutor.present) {
      map['assigned_prosecutor'] = Variable<String>(assignedProsecutor.value);
    }
    if (nextHearingTypeId.present) {
      map['next_hearing_type_id'] = Variable<int>(nextHearingTypeId.value);
    }
    if (nextHearing.present) {
      map['next_hearing'] = Variable<DateTime>(nextHearing.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CasesCompanion(')
          ..write('id: $id, ')
          ..write('clientId: $clientId, ')
          ..write('jurisdictionType: $jurisdictionType, ')
          ..write('state: $state, ')
          ..write('county: $county, ')
          ..write('caseNumber: $caseNumber, ')
          ..write('charge: $charge, ')
          ..write('assignedProsecutor: $assignedProsecutor, ')
          ..write('nextHearingTypeId: $nextHearingTypeId, ')
          ..write('nextHearing: $nextHearing')
          ..write(')'))
        .toString();
  }
}

class $ClientsTable extends Clients with TableInfo<$ClientsTable, Client> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClientsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, firstName, lastName, email, phone];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'clients';
  @override
  VerificationContext validateIntegrity(Insertable<Client> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Client map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Client(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
    );
  }

  @override
  $ClientsTable createAlias(String alias) {
    return $ClientsTable(attachedDatabase, alias);
  }
}

class Client extends DataClass implements Insertable<Client> {
  final int id;
  final String firstName;
  final String lastName;
  final String? email;
  final String? phone;
  const Client(
      {required this.id,
      required this.firstName,
      required this.lastName,
      this.email,
      this.phone});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    return map;
  }

  ClientsCompanion toCompanion(bool nullToAbsent) {
    return ClientsCompanion(
      id: Value(id),
      firstName: Value(firstName),
      lastName: Value(lastName),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
    );
  }

  factory Client.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Client(
      id: serializer.fromJson<int>(json['id']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      email: serializer.fromJson<String?>(json['email']),
      phone: serializer.fromJson<String?>(json['phone']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'email': serializer.toJson<String?>(email),
      'phone': serializer.toJson<String?>(phone),
    };
  }

  Client copyWith(
          {int? id,
          String? firstName,
          String? lastName,
          Value<String?> email = const Value.absent(),
          Value<String?> phone = const Value.absent()}) =>
      Client(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email.present ? email.value : this.email,
        phone: phone.present ? phone.value : this.phone,
      );
  Client copyWithCompanion(ClientsCompanion data) {
    return Client(
      id: data.id.present ? data.id.value : this.id,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      email: data.email.present ? data.email.value : this.email,
      phone: data.phone.present ? data.phone.value : this.phone,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Client(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('email: $email, ')
          ..write('phone: $phone')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, firstName, lastName, email, phone);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Client &&
          other.id == this.id &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.email == this.email &&
          other.phone == this.phone);
}

class ClientsCompanion extends UpdateCompanion<Client> {
  final Value<int> id;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String?> email;
  final Value<String?> phone;
  const ClientsCompanion({
    this.id = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
  });
  ClientsCompanion.insert({
    this.id = const Value.absent(),
    required String firstName,
    required String lastName,
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
  })  : firstName = Value(firstName),
        lastName = Value(lastName);
  static Insertable<Client> custom({
    Expression<int>? id,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? email,
    Expression<String>? phone,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
    });
  }

  ClientsCompanion copyWith(
      {Value<int>? id,
      Value<String>? firstName,
      Value<String>? lastName,
      Value<String?>? email,
      Value<String?>? phone}) {
    return ClientsCompanion(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClientsCompanion(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('email: $email, ')
          ..write('phone: $phone')
          ..write(')'))
        .toString();
  }
}

class $HearingTypesTable extends HearingTypes
    with TableInfo<$HearingTypesTable, HearingType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HearingTypesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  @override
  List<GeneratedColumn> get $columns => [id, type];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hearing_types';
  @override
  VerificationContext validateIntegrity(Insertable<HearingType> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HearingType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HearingType(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
    );
  }

  @override
  $HearingTypesTable createAlias(String alias) {
    return $HearingTypesTable(attachedDatabase, alias);
  }
}

class HearingType extends DataClass implements Insertable<HearingType> {
  final int id;
  final String type;
  const HearingType({required this.id, required this.type});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['type'] = Variable<String>(type);
    return map;
  }

  HearingTypesCompanion toCompanion(bool nullToAbsent) {
    return HearingTypesCompanion(
      id: Value(id),
      type: Value(type),
    );
  }

  factory HearingType.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HearingType(
      id: serializer.fromJson<int>(json['id']),
      type: serializer.fromJson<String>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'type': serializer.toJson<String>(type),
    };
  }

  HearingType copyWith({int? id, String? type}) => HearingType(
        id: id ?? this.id,
        type: type ?? this.type,
      );
  HearingType copyWithCompanion(HearingTypesCompanion data) {
    return HearingType(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HearingType(')
          ..write('id: $id, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HearingType && other.id == this.id && other.type == this.type);
}

class HearingTypesCompanion extends UpdateCompanion<HearingType> {
  final Value<int> id;
  final Value<String> type;
  const HearingTypesCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
  });
  HearingTypesCompanion.insert({
    this.id = const Value.absent(),
    required String type,
  }) : type = Value(type);
  static Insertable<HearingType> custom({
    Expression<int>? id,
    Expression<String>? type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
    });
  }

  HearingTypesCompanion copyWith({Value<int>? id, Value<String>? type}) {
    return HearingTypesCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HearingTypesCompanion(')
          ..write('id: $id, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CasesTable cases = $CasesTable(this);
  late final $ClientsTable clients = $ClientsTable(this);
  late final $HearingTypesTable hearingTypes = $HearingTypesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [cases, clients, hearingTypes];
}

typedef $$CasesTableCreateCompanionBuilder = CasesCompanion Function({
  Value<int> id,
  required int clientId,
  required String jurisdictionType,
  Value<String?> state,
  Value<String?> county,
  required String caseNumber,
  required String charge,
  Value<String?> assignedProsecutor,
  required int nextHearingTypeId,
  required DateTime nextHearing,
});
typedef $$CasesTableUpdateCompanionBuilder = CasesCompanion Function({
  Value<int> id,
  Value<int> clientId,
  Value<String> jurisdictionType,
  Value<String?> state,
  Value<String?> county,
  Value<String> caseNumber,
  Value<String> charge,
  Value<String?> assignedProsecutor,
  Value<int> nextHearingTypeId,
  Value<DateTime> nextHearing,
});

class $$CasesTableFilterComposer extends Composer<_$AppDatabase, $CasesTable> {
  $$CasesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get clientId => $composableBuilder(
      column: $table.clientId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get jurisdictionType => $composableBuilder(
      column: $table.jurisdictionType,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get state => $composableBuilder(
      column: $table.state, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get county => $composableBuilder(
      column: $table.county, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get caseNumber => $composableBuilder(
      column: $table.caseNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get charge => $composableBuilder(
      column: $table.charge, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get assignedProsecutor => $composableBuilder(
      column: $table.assignedProsecutor,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get nextHearingTypeId => $composableBuilder(
      column: $table.nextHearingTypeId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get nextHearing => $composableBuilder(
      column: $table.nextHearing, builder: (column) => ColumnFilters(column));
}

class $$CasesTableOrderingComposer
    extends Composer<_$AppDatabase, $CasesTable> {
  $$CasesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get clientId => $composableBuilder(
      column: $table.clientId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get jurisdictionType => $composableBuilder(
      column: $table.jurisdictionType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get state => $composableBuilder(
      column: $table.state, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get county => $composableBuilder(
      column: $table.county, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get caseNumber => $composableBuilder(
      column: $table.caseNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get charge => $composableBuilder(
      column: $table.charge, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get assignedProsecutor => $composableBuilder(
      column: $table.assignedProsecutor,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get nextHearingTypeId => $composableBuilder(
      column: $table.nextHearingTypeId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get nextHearing => $composableBuilder(
      column: $table.nextHearing, builder: (column) => ColumnOrderings(column));
}

class $$CasesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CasesTable> {
  $$CasesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get clientId =>
      $composableBuilder(column: $table.clientId, builder: (column) => column);

  GeneratedColumn<String> get jurisdictionType => $composableBuilder(
      column: $table.jurisdictionType, builder: (column) => column);

  GeneratedColumn<String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  GeneratedColumn<String> get county =>
      $composableBuilder(column: $table.county, builder: (column) => column);

  GeneratedColumn<String> get caseNumber => $composableBuilder(
      column: $table.caseNumber, builder: (column) => column);

  GeneratedColumn<String> get charge =>
      $composableBuilder(column: $table.charge, builder: (column) => column);

  GeneratedColumn<String> get assignedProsecutor => $composableBuilder(
      column: $table.assignedProsecutor, builder: (column) => column);

  GeneratedColumn<int> get nextHearingTypeId => $composableBuilder(
      column: $table.nextHearingTypeId, builder: (column) => column);

  GeneratedColumn<DateTime> get nextHearing => $composableBuilder(
      column: $table.nextHearing, builder: (column) => column);
}

class $$CasesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CasesTable,
    Case,
    $$CasesTableFilterComposer,
    $$CasesTableOrderingComposer,
    $$CasesTableAnnotationComposer,
    $$CasesTableCreateCompanionBuilder,
    $$CasesTableUpdateCompanionBuilder,
    (Case, BaseReferences<_$AppDatabase, $CasesTable, Case>),
    Case,
    PrefetchHooks Function()> {
  $$CasesTableTableManager(_$AppDatabase db, $CasesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CasesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CasesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CasesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> clientId = const Value.absent(),
            Value<String> jurisdictionType = const Value.absent(),
            Value<String?> state = const Value.absent(),
            Value<String?> county = const Value.absent(),
            Value<String> caseNumber = const Value.absent(),
            Value<String> charge = const Value.absent(),
            Value<String?> assignedProsecutor = const Value.absent(),
            Value<int> nextHearingTypeId = const Value.absent(),
            Value<DateTime> nextHearing = const Value.absent(),
          }) =>
              CasesCompanion(
            id: id,
            clientId: clientId,
            jurisdictionType: jurisdictionType,
            state: state,
            county: county,
            caseNumber: caseNumber,
            charge: charge,
            assignedProsecutor: assignedProsecutor,
            nextHearingTypeId: nextHearingTypeId,
            nextHearing: nextHearing,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int clientId,
            required String jurisdictionType,
            Value<String?> state = const Value.absent(),
            Value<String?> county = const Value.absent(),
            required String caseNumber,
            required String charge,
            Value<String?> assignedProsecutor = const Value.absent(),
            required int nextHearingTypeId,
            required DateTime nextHearing,
          }) =>
              CasesCompanion.insert(
            id: id,
            clientId: clientId,
            jurisdictionType: jurisdictionType,
            state: state,
            county: county,
            caseNumber: caseNumber,
            charge: charge,
            assignedProsecutor: assignedProsecutor,
            nextHearingTypeId: nextHearingTypeId,
            nextHearing: nextHearing,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CasesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CasesTable,
    Case,
    $$CasesTableFilterComposer,
    $$CasesTableOrderingComposer,
    $$CasesTableAnnotationComposer,
    $$CasesTableCreateCompanionBuilder,
    $$CasesTableUpdateCompanionBuilder,
    (Case, BaseReferences<_$AppDatabase, $CasesTable, Case>),
    Case,
    PrefetchHooks Function()>;
typedef $$ClientsTableCreateCompanionBuilder = ClientsCompanion Function({
  Value<int> id,
  required String firstName,
  required String lastName,
  Value<String?> email,
  Value<String?> phone,
});
typedef $$ClientsTableUpdateCompanionBuilder = ClientsCompanion Function({
  Value<int> id,
  Value<String> firstName,
  Value<String> lastName,
  Value<String?> email,
  Value<String?> phone,
});

class $$ClientsTableFilterComposer
    extends Composer<_$AppDatabase, $ClientsTable> {
  $$ClientsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));
}

class $$ClientsTableOrderingComposer
    extends Composer<_$AppDatabase, $ClientsTable> {
  $$ClientsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));
}

class $$ClientsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ClientsTable> {
  $$ClientsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);
}

class $$ClientsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ClientsTable,
    Client,
    $$ClientsTableFilterComposer,
    $$ClientsTableOrderingComposer,
    $$ClientsTableAnnotationComposer,
    $$ClientsTableCreateCompanionBuilder,
    $$ClientsTableUpdateCompanionBuilder,
    (Client, BaseReferences<_$AppDatabase, $ClientsTable, Client>),
    Client,
    PrefetchHooks Function()> {
  $$ClientsTableTableManager(_$AppDatabase db, $ClientsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClientsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClientsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClientsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> firstName = const Value.absent(),
            Value<String> lastName = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> phone = const Value.absent(),
          }) =>
              ClientsCompanion(
            id: id,
            firstName: firstName,
            lastName: lastName,
            email: email,
            phone: phone,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String firstName,
            required String lastName,
            Value<String?> email = const Value.absent(),
            Value<String?> phone = const Value.absent(),
          }) =>
              ClientsCompanion.insert(
            id: id,
            firstName: firstName,
            lastName: lastName,
            email: email,
            phone: phone,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ClientsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ClientsTable,
    Client,
    $$ClientsTableFilterComposer,
    $$ClientsTableOrderingComposer,
    $$ClientsTableAnnotationComposer,
    $$ClientsTableCreateCompanionBuilder,
    $$ClientsTableUpdateCompanionBuilder,
    (Client, BaseReferences<_$AppDatabase, $ClientsTable, Client>),
    Client,
    PrefetchHooks Function()>;
typedef $$HearingTypesTableCreateCompanionBuilder = HearingTypesCompanion
    Function({
  Value<int> id,
  required String type,
});
typedef $$HearingTypesTableUpdateCompanionBuilder = HearingTypesCompanion
    Function({
  Value<int> id,
  Value<String> type,
});

class $$HearingTypesTableFilterComposer
    extends Composer<_$AppDatabase, $HearingTypesTable> {
  $$HearingTypesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));
}

class $$HearingTypesTableOrderingComposer
    extends Composer<_$AppDatabase, $HearingTypesTable> {
  $$HearingTypesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));
}

class $$HearingTypesTableAnnotationComposer
    extends Composer<_$AppDatabase, $HearingTypesTable> {
  $$HearingTypesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);
}

class $$HearingTypesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HearingTypesTable,
    HearingType,
    $$HearingTypesTableFilterComposer,
    $$HearingTypesTableOrderingComposer,
    $$HearingTypesTableAnnotationComposer,
    $$HearingTypesTableCreateCompanionBuilder,
    $$HearingTypesTableUpdateCompanionBuilder,
    (
      HearingType,
      BaseReferences<_$AppDatabase, $HearingTypesTable, HearingType>
    ),
    HearingType,
    PrefetchHooks Function()> {
  $$HearingTypesTableTableManager(_$AppDatabase db, $HearingTypesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HearingTypesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HearingTypesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HearingTypesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> type = const Value.absent(),
          }) =>
              HearingTypesCompanion(
            id: id,
            type: type,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String type,
          }) =>
              HearingTypesCompanion.insert(
            id: id,
            type: type,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$HearingTypesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $HearingTypesTable,
    HearingType,
    $$HearingTypesTableFilterComposer,
    $$HearingTypesTableOrderingComposer,
    $$HearingTypesTableAnnotationComposer,
    $$HearingTypesTableCreateCompanionBuilder,
    $$HearingTypesTableUpdateCompanionBuilder,
    (
      HearingType,
      BaseReferences<_$AppDatabase, $HearingTypesTable, HearingType>
    ),
    HearingType,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CasesTableTableManager get cases =>
      $$CasesTableTableManager(_db, _db.cases);
  $$ClientsTableTableManager get clients =>
      $$ClientsTableTableManager(_db, _db.clients);
  $$HearingTypesTableTableManager get hearingTypes =>
      $$HearingTypesTableTableManager(_db, _db.hearingTypes);
}
