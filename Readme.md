## Linux karnel mod
This is for my exercise.
v6.1 kernel build env is needed.

```
git clone --depth 1 https://github.com/devformoonlight/nakafs.git
cd nakafsnakafs
```

```
make
sudo make install
suo modprobe 
```

```
lsmod | grep nakafs
modinfo nakafs
```

```
mkdir -p ~/mnt_nakafs
sudo mount -t nakafs none ~/mnt_nakafs
```

```
sudo chown ec2-user:ec2-user ~/mnt_nakafs
echo "Hello, Nakafs!" > ~/mnt_nakafs/test.txt
stat ~/mnt_nakafs/test.txt
```

```
sudo umount ~/mnt_nakafs
sudo modprobe -r nakafs
```

thats all.