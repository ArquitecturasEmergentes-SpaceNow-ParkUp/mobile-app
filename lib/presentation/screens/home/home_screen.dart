import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../../shared/constants/app_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Park Up'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthBloc>().add(const LogoutRequested());
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(AppConstants.defaultPadding.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildWelcomeCard(context),
            SizedBox(height: 24.h),
            _buildFeaturesGrid(context),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.local_parking,
                  size: 32.w,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    '¡Bienvenido a Park Up!',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Text(
              'Encuentra y reserva estacionamientos de manera fácil y rápida.',
              style: TextStyle(
                fontSize: 14.sp,
                color: Theme.of(context).textTheme.bodyMedium?.color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturesGrid(BuildContext context) {
    final features = [
      {
        'icon': Icons.search,
        'title': 'Buscar',
        'description': 'Encuentra estacionamientos cercanos',
        'color': Colors.blue,
      },
      {
        'icon': Icons.book_online,
        'title': 'Reservar',
        'description': 'Reserva tu lugar con anticipación',
        'color': Colors.green,
      },
      {
        'icon': Icons.payment,
        'title': 'Pagar',
        'description': 'Pago seguro y fácil',
        'color': Colors.orange,
      },
      {
        'icon': Icons.history,
        'title': 'Historial',
        'description': 'Revisa tus reservas anteriores',
        'color': const Color(0xFF1605AC),
      },
    ];

    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 16.h,
          childAspectRatio: 1.2,
        ),
        itemCount: features.length,
        itemBuilder: (context, index) {
          final feature = features[index];
          return Card(
            child: InkWell(
              onTap: () {
                // TODO: Implement feature navigation
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${feature['title']} - Próximamente')),
                );
              },
              borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      feature['icon'] as IconData,
                      size: 28.w,
                      color: feature['color'] as Color,
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      feature['title'] as String,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 3.h),
                    Flexible(
                      child: Text(
                        feature['description'] as String,
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: Theme.of(context).textTheme.bodySmall?.color,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
