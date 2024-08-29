import React, { useState } from 'react';
import { FlatList, View, Text, Image, TouchableOpacity } from 'react-native';

const ContactItem = ({ name, phone }) => {
  const avatarUrl = https;//avatar.iran.liara.run/public/${name};

  return (
    <View style={styles.contactItem}>
      <Image source={{ uri: avatarUrl }} style={styles.avatar} />
      <View style={styles.contactInfo}>
        <Text style={styles.name}>{name}</Text>
        <Text style={styles.phone}>{phone}</Text>
      </View>
      <TouchableOpacity style={styles.actionButton}>
        <Text></Text>
      </TouchableOpacity>
      <TouchableOpacity style={styles.actionButton}>
        <Text>️</Text>
      </TouchableOpacity>
    </View>
  );
};

const ContactList = () => {
  const [contacts] = useState([
    { name: 'John Doe', phone: '+1 (234) 4331211 22' },
    // ... tambah kontak lainnya di sini
  ]);

  return (
    <FlatList
      data={contacts}
      renderItem={({ item }) => <ContactItem name={item.name} phone={item.phone} />}
      keyExtractor={(item) => item.name}
    />
  );
};

export default ContactList;
