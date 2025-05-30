import 'package:flutter/material.dart';
import 'package:hackoverflow/screen/doctor/Alerts.dart';
import 'package:hackoverflow/screen/doctor/PastAppointmentsPage.dart';
import 'package:hackoverflow/screen/doctor/request_appointment.dart';
import './components/AppointmentCard.dart';
import './components/ProfileGreeting.dart';
import './components/BottomNavBar.dart';
import './components/TilesSection.dart';
import '../doctor/ProfilePage.dart';

class DoctorDashboard extends StatefulWidget {
  const DoctorDashboard({super.key});

  @override
  State<DoctorDashboard> createState() => _DoctorDashboardState();
}

class _DoctorDashboardState extends State<DoctorDashboard> {
  int _selectedIndex = 0;

  // Method to handle navigation between different screens
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Header for the Doctor's Dashboard screen
  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF6D9EEB), Color(0xFF3C78D8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          ProfileGreeting(doctorName: 'Dr. Harshit Masiwal'),
        ],
      ),
    );
  }

  // List of upcoming appointments
  Widget _buildAppointmentsList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: const [
          AppointmentCard(
            patientName: 'John Doe',
            age: 28,
            gender: 'Male',
            symptoms: 'Fever, Headache, Cough',
            time: 'March 12, 2023 - 10:30 AM',
            profileImage: 'assets/doctor.webp',
          ),
          AppointmentCard(
            patientName: 'John Doe',
            age: 28,
            gender: 'Male',
            symptoms: 'Fever, Headache, Cough',
            time: 'March 12, 2023 - 10:30 AM',
            profileImage: 'assets/doctor.webp',
          ),
          AppointmentCard(
            patientName: 'John Doe',
            age: 28,
            gender: 'Male',
            symptoms: 'Fever, Headache, Cough',
            time: 'March 12, 2023 - 10:30 AM',
            profileImage: 'assets/doctor.webp',
          )
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const TilesSection(),
              const SizedBox(height: 8),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16), // Added padding
                child: Text(
                  'Upcoming Appointments',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ),
              _buildAppointmentsList(),
            ],
          ),
        );
      case 1:
        return RequestAppointmentPage();
      case 2:
        return PastAppointmentsPage();
      case 3:
        return ProfilePage();
      case 4:
        return NotificationsPage();
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(child: _buildBody()),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
