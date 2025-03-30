import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_mate/presentation/pages/profile/bloc/profile_bloc.dart';
import 'package:money_mate/presentation/pages/profile_detail/widgets/profile_data_widget.dart';
import 'package:money_mate/shared/components/loading_scafford.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return state.maybeMap(
          loaded: (state) {
            final user = state.profile;
            return ProfileDataWidget(user, false);
          },
          updating: (state) {
            final user = state.user;
            return ProfileDataWidget(user, true);
          },
          orElse: () => const LoadingScaffold(
            isLoading: true,
            child: SizedBox(),
          ),
        );
      },
    );
  }
}
