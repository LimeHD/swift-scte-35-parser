//
//  DTMFDescriptor.swift
//  
//
//  Created by Robert Galluccio on 30/01/2021.
//

/// The `DTMFDescriptor` is an implementation of a `SpliceDescriptor`. It provides an optional extension
/// to the `SpliceInsert` command that allows a receiver device to generate a legacy analogue DTMF
/// sequence based on a `SpliceInfoSection` being received.
/**
 ```
 DTMF_descriptor() {
   splice_descriptor_tag          8 uimsbf
   descriptor_length              8 uimsbf
   identifier                    32 uimsbf
   preroll                        8 uimsbf
   dtmf_count                     3 uimsbf
   reserved                       5 bslbf
   for(i=0; i<dtmf_count; i++) {
     DTMF_char                    8 uimsbf
   }
 }
 ```
 */
public struct DTMFDescriptor {
    /// This 32-bit number is used to identify the owner of the descriptor. The identifier shall have a
    /// value of 0x43554549 (ASCII "CUEI").
    public let identifier: UInt32
    /// This 8-bit number is the time the DTMF is presented to the analogue output of the device in
    /// tenths of seconds. This gives a preroll range of 0 to 25.5 seconds. The splice info section shall
    /// be sent at least two seconds earlier then this value. The minimum suggested preroll is 4.0
    /// seconds.
    public let preroll: UInt8
    /// This is a string of ASCII values from the numerals `0` to `9`, `*`, `#`. The string represents a
    /// DTMF sequence to be output on an analogue output. The string shall complete with the last
    /// character sent being the timing mark for the `preroll`.
    public let dtmfChars: String
}