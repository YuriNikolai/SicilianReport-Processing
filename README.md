# The Sicilian Report

This is an open-source game being developed under the design philosophy of The Snowfield - instead of massive content generation, segments of gameplay are added and fine-tuned based on the interactions observed from early testers, in an "inversion of the traditional relationship between Design and QA to create a highly improvisational game world".

**Controls**

Left mouse drag to carry pins and images. You can connect pins by dropping them on top of each other. Right mouse drag to split connected pins or move them without moving the images below.

**Step-by-step**

<details>
  <summary>Tier 1 ciphers solution</summary>
  
 The scratched numbers on the table's centerpiece are the keys for the two Caesar ciphers, which when solved, reward you with the keys for the two Vigenère ciphers. This can be deduced by the scratches under the numbers and under certain words on the cards. Both Caesar ciphers are on cards with images related to a relevant family's crest.
  
  The cipher on the Tomasi di Lampedusa family crest is more obfuscated by using the Italian alphabet instead of the English one (21 chars instead of 26). It translates to "Ill gattopardo", and "gattopardo" is the important word here for the later Vigenère cipher.
  
  The second Caesar cipher (key 5) solves to "What else has the Crescent paid for?" and the underlined word is Crescent.
  
</details>

<details>
  <summary>Tier 2 ciphers solution</summary>

  The worn cards contain Vigenère ciphers. Outside of brute force, a crescent drawing tells you which key goes on which card. The card with the 'gattopardo' key translates to "What was brought to the shaded mausoleum by the sea?" It is accompanied by a non-encrypted bit of text saying "Who brought it?" This could tentatively be connected to marabouts, saracens, berbers, or any other number of muslim parties active in the Mediterranean.
  
  The second worn card, with the key 'crescent', translates to "To E??????, Hanged Christ meant the questioning of historical dogma. Why did the Crescentii support them?" A second unencrypted part says "No matter now. Damnatio Memorae." The redacted word's lenght needs to be correctly guessed from the centerpiece or from the letter for proper decryption.
