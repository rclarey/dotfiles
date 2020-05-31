function findsilver
  ping -t 5 192.168.0.255 > /dev/null
  arp -ax | rg '2:9:5b:7:ad:c9|0:f:60:7:ad:c9'
end
