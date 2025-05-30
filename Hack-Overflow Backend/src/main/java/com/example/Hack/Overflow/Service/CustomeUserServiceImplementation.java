package com.example.Hack.Overflow.Service;


import com.example.Hack.Overflow.Model.USER_ROLE;
import com.example.Hack.Overflow.Model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import com.example.Hack.Overflow.Repo.UserRepository;

import java.util.ArrayList;
import java.util.List;

@Service
public class CustomeUserServiceImplementation implements UserDetailsService {
	@Autowired
	private UserRepository userRepository;

	public CustomeUserServiceImplementation(UserRepository userRepository) {
		this.userRepository = userRepository;
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {


		User user = (User) userRepository.findByEmail(username);

		if (user == null) {

			throw new UsernameNotFoundException("user not found with email  - " + username);
		}

		USER_ROLE role = user.getRole();

		if (role == null) role = USER_ROLE.PATIENT;

		System.out.println("role  ---- " + role);

		List<GrantedAuthority> authorities = new ArrayList<>();

		authorities.add(new SimpleGrantedAuthority(role.toString()));
		return new org.springframework.security.core.userdetails.User(
				user.getEmail(),
				user.getPassword(),
				authorities
		);

	}

}
