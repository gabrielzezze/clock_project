LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY memoria_rom IS

    GENERIC (
        dataWidth : NATURAL := 8;
        addrWidth : NATURAL := 3
    );
    PORT (
        Endereco : IN std_logic_vector (addrWidth - 1 DOWNTO 0);
        Dado     : OUT std_logic_vector (dataWidth - 1 DOWNTO 0)
    );

END ENTITY;

ARCHITECTURE assincrona OF memoria_rom IS

    TYPE blocoMemoria IS ARRAY(0 TO 2 ** addrWidth - 1) OF std_logic_vector(dataWidth - 1 DOWNTO 0);

    CONSTANT Jump      : std_logic_vector(3 DOWNTO 0) := "0000";
    CONSTANT Load      : std_logic_vector(3 DOWNTO 0) := "0001";
    CONSTANT Store     : std_logic_vector(3 DOWNTO 0) := "0010";
    CONSTANT AddAccMem : std_logic_vector(3 DOWNTO 0) := "0011";
    CONSTANT SubAccMem : std_logic_vector(3 DOWNTO 0) := "0100";

    FUNCTION initMemory
        RETURN blocoMemoria IS VARIABLE tmp : blocoMemoria := (OTHERS => (OTHERS => '0'));
        BEGIN
tmp(0) := "0011000000000000000000"; 
tmp(1) := "0101000000000001000000"; 
tmp(2) := "0101000000000001000001"; 
tmp(3) := "0101000000000001000010"; 
tmp(4) := "0101000000000000000101"; 
tmp(5) := "0101000000000000000110"; 
tmp(6) := "0101000000000000000111"; 
tmp(7) := "0011000000000000000001"; 
tmp(8) := "0100001001001000000001"; 
tmp(9) := "0111000001000000000000"; 
tmp(10) := "1001000000000000001100"; 
tmp(11) := "1000000000000000010110"; 
tmp(12) := "0011000000000000000001"; 
tmp(13) := "0100001001001000000010"; 
tmp(14) := "0111000001000000000000"; 
tmp(15) := "1001000000000000010001"; 
tmp(16) := "1000000000000000101000"; 
tmp(17) := "0011000000000000000001"; 
tmp(18) := "0100001001001000000011"; 
tmp(19) := "0111000001000000000000"; 
tmp(20) := "1001000000000001001100"; 
tmp(21) := "1000000000000000111010"; 
tmp(22) := "0100010010010001000000"; 
tmp(23) := "0011011011011000000001"; 
tmp(24) := "0001010011010000000000"; 
tmp(25) := "0011100100100000111100"; 
tmp(26) := "0111010100000000000000"; 
tmp(27) := "1001000000000000100011"; 
tmp(28) := "0011100100100000111101"; 
tmp(29) := "0111010100000000000000"; 
tmp(30) := "1001000000000000100011"; 
tmp(31) := "0101010010010000000101"; 
tmp(32) := "0101010010010001000000"; 
tmp(33) := "0101000000000000001001"; 
tmp(34) := "1000000000000001001100"; 
tmp(35) := "0011010010010000000000"; 
tmp(36) := "0101010010010001000000"; 
tmp(37) := "0101010010010000000101"; 
tmp(38) := "0101000000000000001001"; 
tmp(39) := "1000000000000001001100"; 
tmp(40) := "0100010010010001000001"; 
tmp(41) := "0011011011011000000001"; 
tmp(42) := "0001010011010000000000"; 
tmp(43) := "0011100100100000111100"; 
tmp(44) := "0111010100000000000000"; 
tmp(45) := "1001000000000000110101"; 
tmp(46) := "0011100100100000111101"; 
tmp(47) := "0111010100000000000000"; 
tmp(48) := "1001000000000000110101"; 
tmp(49) := "0101010010010000000110"; 
tmp(50) := "0101010010010001000001"; 
tmp(51) := "0101000000000000001001"; 
tmp(52) := "1000000000000001001100"; 
tmp(53) := "0011010010010000000000"; 
tmp(54) := "0101010010010001000001"; 
tmp(55) := "0101010010010000000110"; 
tmp(56) := "0101000000000000001001"; 
tmp(57) := "1000000000000001001100"; 
tmp(58) := "0100010010010001000010"; 
tmp(59) := "0011011011011000000001"; 
tmp(60) := "0001010011010000000000"; 
tmp(61) := "0011100100100000011000"; 
tmp(62) := "0111010100000000000000"; 
tmp(63) := "1001000000000001000111"; 
tmp(64) := "0011100100100000011001"; 
tmp(65) := "0111010100000000000000"; 
tmp(66) := "1001000000000001000111"; 
tmp(67) := "0101010010010000000111"; 
tmp(68) := "0101010010010001000010"; 
tmp(69) := "0101000000000000001001"; 
tmp(70) := "1000000000000001001100"; 
tmp(71) := "0011010010010000000000"; 
tmp(72) := "0101010010010001000010"; 
tmp(73) := "0101010010010000000111"; 
tmp(74) := "0101000000000000001001"; 
tmp(75) := "1000000000000001001100"; 
tmp(76) := "0011001001001000000000"; 
tmp(77) := "0100000000000000001000"; 
tmp(78) := "0111000001000000000000"; 
tmp(79) := "1001000000000001001100"; 
tmp(80) := "0100010010010001000000"; 
tmp(81) := "0011011011011000000001"; 
tmp(82) := "0001010011010000000000"; 
tmp(83) := "0011100100100000111100"; 
tmp(84) := "0111010100000000000000"; 
tmp(85) := "1001000000000001011010"; 
tmp(86) := "0101010010010000000101"; 
tmp(87) := "0101010010010001000000"; 
tmp(88) := "0101000000000000001001"; 
tmp(89) := "1000000000000000000111"; 
tmp(90) := "0011010010010000000000"; 
tmp(91) := "0101010010010001000000"; 
tmp(92) := "0101010010010000000101"; 
tmp(93) := "0100010010010001000001"; 
tmp(94) := "0011011011011000000001"; 
tmp(95) := "0001010011010000000000"; 
tmp(96) := "0011100100100000111100"; 
tmp(97) := "0111010100000000000000"; 
tmp(98) := "1001000000000001100111"; 
tmp(99) := "0101010010010000000110"; 
tmp(100) := "0101010010010001000001"; 
tmp(101) := "0101000000000000001001"; 
tmp(102) := "1000000000000000000111"; 
tmp(103) := "0011010010010000000000"; 
tmp(104) := "0101010010010001000001"; 
tmp(105) := "0101010010010000000110"; 
tmp(106) := "0100010010010001000010"; 
tmp(107) := "0011011011011000000001"; 
tmp(108) := "0001010011010000000000"; 
tmp(109) := "0011100100100000011000"; 
tmp(110) := "0111010100000000000000"; 
tmp(111) := "1001000000000001110100"; 
tmp(112) := "0101010010010000000111"; 
tmp(113) := "0101010010010001000010"; 
tmp(114) := "0101000000000000001001"; 
tmp(115) := "1000000000000000000111"; 
tmp(116) := "0011010010010000000000"; 
tmp(117) := "0101010010010001000010"; 
tmp(118) := "0101010010010000000111"; 
tmp(119) := "1000000000000000000111"; 
 

            RETURN tmp;
        END initMemory;

    SIGNAL memROM : blocoMemoria := initMemory;
BEGIN
    Dado <= memROM (to_integer(unsigned(Endereco)));

END ARCHITECTURE;