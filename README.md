Vagrant-Devstack
======================

### Devstack installation script using vagrant
#### Cách sử dụng:
##### 1. Yêu cầu:
- Tải vagrant phiên bản mới (từ 1.7 trở lên).
- Tải virtualbox phiên bản mới (từ 4.3).
- Git clone đường dẫn từ vietstack.

##### 2. Các bước tiến hành:
- Truy cập vào foler /vagrant-devstack và chạy câu lênh "$vagrant up" để tạo máy ảo.
- Sau khi các máy ảo được boot, sẽ có 2 máy ảo bao gồm master (controller+compute) và slave (compute)
- Đối với máy ảo master:

* 2.1 Chạy câu lệnh "$vagrant ssh master".
* 2.2 Git clone devstack từ trang chủ của devstack.
* 2.3 Vào folder "/home/vagrant/devstack" tạo file local.conf
* 2.4 Chạy lệnh  "$git checkout stable/icehouse".
* 2.5 Copy nội dung file master_local vào file local.conf
* 2.6 Chạy "$./stack.sh" 

- Đối với máy ảo slave:

::: Chạy câu lênh "$vagrant ssh slave"

::: Note: Các bước còn lại làm tương tự như máy ảo master, thay vì copy nội dung file master_local, ta copy nội dung 
file slave_local vào file local.conf
