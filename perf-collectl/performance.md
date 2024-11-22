# Performance monitor linux machine

This document give a shor brief of performance monitor using the `collectl` tools.
You need to download it from https://collectl.sourceforge.net/index-colplot.html
and extract it locally under `./collectl` folder

The script plot-file is building a plot picture after collecting a data using the first record command:

1. __Record__ CPU and memory:
   subsystems: cpu, intterrupt, memory, disk, network, tcp, files

    ```bash
    collectl -scjmdnti -oTmGu -f <FILE-NAME>
    ```

2. __Playback__ file

    ```bash
    collectl -P -scjmdnti -oTmGcu -p <FILE-NAME>
    ```

Columns description taken from the site 

| Subsystem | Section | Description |
| --------- | ------- | ----------- |
| CPU (%)   | User    | Time spent in User mode, not including time spend in "nice" mode. |
| CPU (%)   | Sys     | This is time spent in "pure" system time. |
| CPU (%)   | Total   | This is total time spent |
| Memory (GB) | Used  | Used physical memory. This does not include memory used by the kernel itself. |
| Network (Rx Pkt) | RXPkt | Incoming packets/sec |
| Network (Tx Pkt) | TXPkt | Outgoing packets/sec |
