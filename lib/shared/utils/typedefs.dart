import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:money_mate/core/network/models/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef VoidResult = ResultFuture<void>;
typedef DataMap = Map<String, dynamic>;
