<?php

// Set header untuk menentukan bahwa respons adalah JSON
header('Content-Type: application/json');

// Pastikan method yang digunakan adalah POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    
    $id_sensor = $_POST['Id_sensor'] ?? null;
    $temperature = $_POST['Temperature'] ?? null;
    $humidity = $_POST['Humidity'] ?? null;
        
        // Pastikan data yang diperlukan ada dalam array
        if ($id_sensor !== null && $temperature !== null && $humidity !== null) {
            
            // Lakukan koneksi ke database
            $host = 'localhost'; // Ganti dengan host database Anda (defult $host = 'localhost')
            $db_name = 'iot_b'; // Ganti dengan nama database Anda
            $username = 'root'; // Ganti dengan nama pengguna database Anda
            $password = ''; // Ganti dengan password database Anda
            
            try {
                $conn = new PDO("mysql:host=$host;dbname=$db_name", $username, $password);
                $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                
                // Siapkan statement SQL untuk menyimpan data sensor
                $stmt = $conn->prepare("INSERT INTO restapi (Temperature, Humidity, Id_sensor) VALUES (:Temperature, :Humidity, :Id_sensor)");
                 
                // Bind parameter ke statement
                $stmt->bindParam(':Id_sensor', $id_sensor);
                $stmt->bindParam(':Temperature', $temperature);
                $stmt->bindParam(':Humidity', $humidity);

                // Eksekusi statement
                $stmt->execute();
                
                // Kirim respons sukses
                echo json_encode(array('success' => true, 'message' => 'Data sensor berhasil disimpan.'));
            } catch(PDOException $e) {
                // Kirim respons jika terjadi kesalahan saat menyimpan ke database
                echo json_encode(array('success' => false, 'message' => 'Gagal menyimpan data sensor: ' . $e->getMessage()));
            }
            
        } else {
            // Kirim respons jika data yang diperlukan tidak lengkap
            echo json_encode(array('success' => false, 'message' => 'Data sensor tidak lengkap.'));
        }
        
    
    
} else {
    // Kirim respons jika metode yang digunakan bukan POST
    echo json_encode(array('success' => false, 'message' => 'Metode yang digunakan tidak diizinkan.'));
}

?>