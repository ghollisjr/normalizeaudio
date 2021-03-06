#!/bin/bash
if [[ $# -ne 2 ]] ; then
    echo "Usage: normalizeaudio.sh <infile> <outfile>"
    echo ""
    echo "normalizeaudio.sh normalizes audio based on EBU R128 standard and commonly recommended parameters."
    echo ""
    echo "normalizeaudio.sh works for both audio and audio-video files."
    exit 1
fi;

infile="$1"
outfile="$2"

#If you wanted to convert mono or stereo into 2 identical channels
#(useful for guaranteed one-ear complete signal), you could do this:
#
#ffmpeg -i "$infile" -af "pan=stereo|c0<c0+c1|c1<c0+c1" -af "loudnorm=I=-16:LRA=11:TP=-1.5" -c:v copy "$outfile"

ffmpeg -i "$infile" -af "loudnorm=I=-16:LRA=11:TP=-1.5" -c:v copy "$outfile"
