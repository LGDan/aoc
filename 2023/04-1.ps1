$textinput = @'
Card   1: 26 36 90  2 75 32  3 21 59 18 | 47 97 83 82 43  7 61 73 57  2 67 31 69 11 44 38 23 52 10 21 45 36 86 49 14
Card   2: 45 10 54 17 15 38 59 96 25 32 | 17 12 77 87 29 70 38 96 15 54 86 64 32 10 28 59 24 45 65 81 42 25 98 14 60
Card   3: 37 31 21 71 80 76 91 77 64 69 | 90 71 91 13  2 40 83 22 45 31 69 53 77 27 97 35  4 55 14  9 52 21 16 19 63
Card   4: 16 82 44 42 51 11 86 14 92 47 | 44 61 81 88 15 11 76 42 17 98 48 83 14 92 99 16 82 86 56 47 10 66 13 22 51
Card   5: 83 84 64 81 97 88 96 59 92 25 | 52 65 98 86 75 48 96 60 56 33 76 81 29 44 97 82 59 64 88 25 23 92 37 84 83
Card   6: 50 51 91 86 25 44 75 23  5 56 | 86 17 56 16 91 75 27 94 39 80 25 71 23 26 12 31 43 45  5 18 50 44 96 51 57
Card   7: 34 14 63 33 87 92 69 67 24 13 | 86 47 31 45  3 32 81 96 21 93 80 25 90 63 79  6 49 91  7 95 62 66 19 24 76
Card   8: 19 67 63 77 62 92 51 49 52  1 | 35  1 94 87 11 82 12 84 49 28 39 96 92 23 34  4 56  5 63 13 77 47 14  9 78
Card   9: 54 14 61 36 10 35 92 34 47 95 | 87 92 95 54  3 47 15 36 90 11  9 84 10 75 45 72 61 88 14 64 35 34 98 46 76
Card  10: 27 59 55 95  4 99  8 48 97  6 | 51 50 48 91 34  4 97 86 27 99 20 95 17  6 80 43 21 60 28 10 89 59 73 55  8
Card  11: 74 46 96 17 62 65 38  4 29  6 | 48 83 42  4 17 35  1 38  6 74 40 95 80 49 46 29 65 62 85 47 96 18 76 36 68
Card  12: 68 12 22 46 33 57 61 86 13 62 | 62 35 20  7 16 78 60 11  9 31 46 34 73 68 77 36 61 66 65 14 26 83 98 95 69
Card  13: 50 14 10  3 83 27 52 84 61 44 | 75 22 56 60 62 36 87 33 85 52  7 95 19 81 10 47 20 73 50 13 46  3 83 37 84
Card  14: 51 42 40 21 29 78 10 31 54 24 | 78 67 10 17 54 99  1 87  8 66 23 56  5 63 92 50 71 47 98  3 73 16 74 42 85
Card  15: 65 68 76  6 40 78 11 60 55 84 | 39 40 59 43 55 69 72 14 94 66 20 80 11 93 64 68 96 34 38 84 67 41 53 89 88
Card  16: 77 95 61 17 74 46 54  3 37 81 |  3 14 41 73 12 75 31 71 24 26 92 74 64 98 89 95 93 19 15 82 91 30 66 81 40
Card  17: 87 11 32 58 43 99  7 79 37 82 | 70 14 67 68 18 29 54 12 15 17 34 71 84 74  4 36 98 42 24 23 38 97 79 81 83
Card  18:  2 70 93 86 50 39 15 76 64  8 | 76 42 75 67 14 39 15 64 45 10 56 12 32  2 93 52  8 68 97 36 79 98 17 37 59
Card  19: 55 53 86 35 88 48 79 56 34 33 | 77 89 45 76 82 23 52 97 62 27  7 38 84 81 99 41 40 70 42 50 21  4 80 12 46
Card  20: 53 21 29 48 42 89 12 34 76 14 | 56 46 69 50 88 85 74 40 66 47 79 77 61  9 67 39 22 63  6 59 54 92 14 51 96
Card  21: 11 87 63 43  5 91 22 45 61 26 | 46 99 43 57 88 75 32 34 91  7 87 15 13 54 66 82  1 10 31 70 24 16  2 90 39
Card  22: 31 89 65 74 38  4 99 40 19  9 | 45 28 54 77  3 42 14 55 41 71 81 84 82 69 64 97 76 48 56 13 23 66 15 30  8
Card  23:  6 59 76 99  9 86  4 84  5 27 | 37 80 51 24 46 72 68 82 89 30 21 55 96  7 91 85 92 93 78 14 70 61  2 11 50
Card  24: 11 37 40 53 70 95 44  3 92 49 | 60 67 54 52 34 93 87 26 74 88  4 91 78 68 17 38 97  7 43 69 64 18 73 15 80
Card  25: 35 52 84 65 30  2 37 89 67 90 | 51 14 25 96 45  4 28 88  8 22 13 66  9 48 82 85 86 54 75 91  1 10 29  5 39
Card  26: 88 84  2 68 47 81  8 11 46 29 | 47 84 98 20 75 63 44 64 15  7 27 53 43 26 68 73  2 91 78 29 46 11 76  8 99
Card  27: 65 94 27 71 54 86 77 47 64 31 | 65  8 27 76 83 64 69 96 78 61  7 11 72 55 41 10 54 93 15 52 90  4 33 94 82
Card  28: 46 89 43 92 93 60 14 34 91 69 | 60 94 46 43 82 53 91 34 92 15 28 55  6 88 57 89 14 67  4 61 36 69  2 93 12
Card  29: 73 54 41 45 29 83 65 70 80 72 | 42 59  6 73 36 87 23 14 47 96 77 72 43 29 70 93 90 50 65 68 56 19 17 63 76
Card  30: 73 18 66  4 96 55 52 59 93 97 | 36 50 90 22 78 96 71 60 87 26 84 74 66 68 55 54 63 73 20 97 10 12 16 76 93
Card  31: 58 42 91 76 86 26 80  5 14 79 |  1 40  4 42 11 13 68 99 10 97 59 76 56 67  5 91 93 26 38 87 80 17 86 33 12
Card  32: 65 29 20 80 13 60 43 18 17 95 | 55 53 72  8 22 45 90 79 81 10 77  5 26 87 52 56 43 30 54 98 93 14 62 74 51
Card  33: 40 81 10 65 18 59  1 68 69 35 | 65 91 69 35 59 48 23 37 33 10 29 11 76 25 55 64 58  9 46 47 83 51 98 68  1
Card  34:  9 87 17 41 81 51 50 20  5 14 | 54 19 81 60 48 90 70 43 44 62 78  3  9  6 87 51  4 47 77 30 82 76 56 13 94
Card  35: 58 71 47  3 59 96 92 30 74  4 |  9 78 30 51 43 82 96 35 48 76 53 52 62 49  4 41 39 93 27 80 87 59 33 34  7
Card  36:  8 45 92 39 66 36 34 69 82 63 | 67 37 24 19 85 46 47 92 74  3 17 97 61 65 83 39 77 34 15 55 75  7 20 28 54
Card  37: 39 59 17 65 89 24 28 87 86 29 |  3 67 73 44 27 68  8 12 32 59  2 50 40 76 62 75 34  5 72 18 52 25 70 90 53
Card  38:  7 91  1 70 12 16 57 78 89 69 | 92 28 56 94 15 44 31 35 51 82 11 52  7 74 62  3 76 93 26  6 19 72 86 30  2
Card  39: 63 43 99 29 91 33 52 96 76 26 | 61 53 42  2 84 73 72 55 49 18 80 34 77 62 43 45 92 50 38 40 89 60 47 69 16
Card  40: 83 91 18 21 48  6 82 85 39 17 | 38 43  7 77 59 40 73  1 49 76 66 64 84 22 53 56 15 42 94 24  2 10 99 70 63
Card  41: 19 74 11 78 71 39 21 58 25 50 | 81 26 33 82 71 58 54  4 19 47 37 73 50 74 99 25 44 39 38 78 21 77 11 88 59
Card  42: 22 15  3 33 62 13 67 18 24 72 | 50  4 86 74 15 38 47 42 89  9 30 87  2 20 33 17 78 45 48 81 62 51 71 35 96
Card  43: 39 42 48 11 23 59 25 54 40 88 |  7 73 32  8  1 60  4 13 14 70 79  3 98 68 76 43 47  6 56 85 92 94 74 62 90
Card  44: 30 16 41 34 89 13  1 53  3 59 | 64 50 55 74 67 78 89 86 63 85 26 28 34 69 59 31 44 56 37 39 20 15 17 71 93
Card  45: 13 57 96 32 69 88 75 15 40 47 | 40 61 32 70 95 29 28 75 87 37 69 57 72 63 15 30 21 38 13 47 20 96 56 76 88
Card  46: 71 28 77 18 39 16 25  1 95 66 | 50 30 39 62 54 25 22 16 24 32 40 41 95 11 64 38 77 14 34 90 86 48  1  4 79
Card  47: 32 31 18 26 43 33 46 39 60 29 | 85 51 41 74 77 14 72 89 65 60 11 92 33 39 18 15 32 95 42 46 94 38 90 68 53
Card  48: 13 47 30  5 40 66 64 51 60 83 | 13 30 84 83 43 40 46  5 98 47 91 86  4 66 23 96 10 92 51 60 93 64 36 71 53
Card  49: 72 99 94 27 31 49 75 36 66 82 | 95  4 14 11 36 89 19 45 50 84 24 72 99 90 82 71 56 16 20 58 39 83 75 49 22
Card  50: 25 81 56  1 64 50 80 79 87 23 | 98 19 25 22 50 24 74 29 51  1 54 39 80 28 23 87 75 56 93 89 55 71  3 65 79
Card  51: 81 10 35 77 13 47 90 24 79 97 | 14 32 77 85 58 17 30 89  8 51 13 76 80 94 79 56 65 43 11  5 19 47 70 90 81
Card  52: 14 34 90 39 44 26 95 17 19 20 | 80 78 93 16 67 15 68 36 98  1 35 45 10 86 65 61 47 26 82  9 69 83 81 23 48
Card  53: 55 75  8 44 62 30 19 97 65 12 | 77 96 15 42 86 84 70 24 68 11 97 69 16 56 66 13 73 74 46 67  2 88 63 50 98
Card  54:  2 69 28 76 77  6 86 74 32 38 | 83 96 73 79 71  8  4 46 63 49 65 16 84 75 26 50 61 37 17 39 36 47 58 14 91
Card  55: 41 89 46 60 37 82 69 52 35 72 | 16 56 63 34 45 59 37  1 29 46 51 75 99 90 76  7 60 57  5 98 62 20 93 50 44
Card  56: 27 11  5 14 81 18 33 36 96 69 | 67 61  6 28 77 63 74 44 60 29 54 93 94 40 83 20 97 66 52 87  2 79 32  1 70
Card  57: 30 91 94 56 18 73 32 88 51 84 | 62 45 54  7 53 96 29 43  3 81 91 80 24 14 46 65 89  4 92 50 71 35 49 47 86
Card  58: 47 55 32 62 21 25 69 60 14 41 | 98 87 10 84 89  4 28 96 72 35 66 31 95 91 76  3 52 45 81 24 97  8  1 27 67
Card  59: 34 10  7 40 92 72  4 44 98 23 | 50 92 98 10  4 17 34 44 65 74 21 64  6 23 40 72 79 86 59 27  7 91 47 63 16
Card  60: 75  7 58 65 17 14 50  8 69 20 | 96 25 69 20 75 50  7  8 64 31 14 17 24 65 93 19 40 62 53 90 34 58 74 85 51
Card  61: 40 93  9 39 71 44 36 80 87 90 | 87 27 25 39 26 36 97 82 79 93 44 15 31 20  2 61 90 55 40 74  1 80  7 95 49
Card  62: 78 91 53 31 29 93 98 99 46 43 | 59 53 28 70 31 37 99  1 82 46 44 60 17 61 43 29 98 93 91  8 42  6 78 32 23
Card  63: 36 20 89 67 86 17 50 29 49 12 | 43 99 83 28 29 94 50 76 82 51 40 47 97 30 20 78 49 72  6 57 46 67 75 68 86
Card  64: 69 24 34 10  2 14 86 38 76  5 | 70 38 34 99 64 10 75 82 58 72  5  2 83 76  9 15 42 81 86 24 59 74 18 69 14
Card  65: 33 69  2 45 25 40 35 48 83 53 | 64 40 33 48 63 96  2 22 53 97 43 69 83 79 20  5 35  9 25 29 74 47 72 99 45
Card  66: 93  1 92 57 71 23 85 51 13 88 | 10 27 92  6 65 28 33 67 53 58 38 13 40 69 90 97 24 50 36 85 54 91 94 30 21
Card  67: 82 25 87 96 97 55 35 90 68 93 | 40 74 21 45 59 82 16 67 79 36 32 28 12 73 81 60 84 54 77 29  7 58 86 34  3
Card  68: 13 22 75 87 19 67 29 51 80 17 | 91 87 16 98 52 24 43 34 19 80 23 21 99 44 27 13 60 42 17 79 67 14  1 31  3
Card  69: 50 35 32 17 92 40 88 41 91 77 | 71 17 41 23 26  5 92 29 55 91 40 83 88 65 51  9 50 53 77 46 54 35 62 32 52
Card  70: 56 61  5 90  8 15  6 46 10 98 | 10 55 82 56 30 72 78 13 91 95 49  6 93 27 74 85 64 62 70  8  9 54 57 45 90
Card  71: 76  2 26 66 56 41 72 70 61 94 | 88 32 97 68 83 37 76 41 36 86  3 84 44  9 24 69  5 95  7 50 35  1 27 77 46
Card  72: 82 38 71 98 60 55 29 73  4  1 | 83 92 69 85 64 97 35 33 20 87 81 71 57 75 66 82 29 19 63 36 23 58 60 93 72
Card  73: 74 70 33 43 58  5 47 18 98 59 | 77 81 75 64 69 92 20  2  1 28 40 32  7 12 57 31 68 36 45 46 61 97 39 66 63
Card  74: 85  6 64 88 46 86  4 25 12 17 | 11 49 38 40 36 46 23 62 84 48 12 60 76 75  9 10 90 35 26 37 69 89  4 17 43
Card  75: 71 52 55 35 87 86 60 27 32 89 | 35 30 73 10 89 98  4 69 22  9 23 17 71 53 87 83 48 86 74 40 21 62 63 85 50
Card  76: 75 66 33 41  3 25 99 98 37 91 | 35 38 12 11 46 40 20 15 94 61 47 79 10 83 24 50 51  2 48 26 63 13 72  4 88
Card  77: 78  8 62 30 92 18 76 36 84 91 |  4 26 82 15 92 94 13 48 33 49 46 60 74 58 81 67 10  2  9 23 70  6 57 53 79
Card  78: 56 55 32 44 13 84 95 85 20 92 |  7 17 87 86 16 60 70 65 74 12  4 18 95  8 19 54 15  6 94 84 82 58 59 28 99
Card  79: 16 14 42 27 10 49 89 65 91 76 | 68 70  1 61 81 71 32 40 51 41 36 31 45 33 18 94 17  2 60 76 74  6 62 79 11
Card  80: 56 78 20 15 58 30 49 75 79 66 | 12 52 96 14 80 34 61  7 40  9 17 47 97  6  2 93 39  3 76 42 43 71 33 67 54
Card  81: 75 44 15 74 17 25 51 28 96 67 | 45 69 89 75  8 67 71 70 46 40 15 96 87 20 28 17 21 42 85 68 44 18 74 59 51
Card  82: 74 29 44 13 94 22 40 80 36 27 | 55 51 74 40 77 36 49 87 43 13 46 62 23 38 90 30 39 57 70  1 80 22 91 32 89
Card  83: 87 21 17 14 49 92 19  1 77 36 | 67 36 31 74 87 13  1 21 35 97 99 52 19 92  9 77 51 49 89 72 14 26 56 17 90
Card  84:  2 60  7 46 57 31 68 83 25  5 | 42 72 20 38 88 35 73 98 92 89 41 90 65 81 96 21 50 62 87 36 43 33  8 66 55
Card  85: 38 43 61 78 57 48 82 80  3 26 | 25 17 61 94 50 69  5 26 39 85 76 58 80  8 33 11 55 38 79 60 82 93 84 20 86
Card  86: 17 36 14 77 98 99 33 38 34  4 | 17 97 98 30 38 65 16 43 28 85 77 36 83 88 29 18 60 26 14 33 80 78 99 34  4
Card  87: 42 52 68 76 78 48 36 50 65 44 | 21 23 42 68 13 43 63 36 33 67  8 66 70 90 48  1 65 50 34  7 69 82 76 78 44
Card  88: 68 67 15 30 92 38 96 63 75 44 | 59 30 83  6 48 42 35 28 46 34 92 44 49 78 43 27 47 75 15 33 62 37  3 68 60
Card  89: 12 46 88 26 86 43 52 83 29 92 |  4 29 60 78 25 43 15 74 73 99 83 86 59 27 96 44 38 48  6 37 52 85 42 41 46
Card  90: 95 71 59 29 13 83 90 57  7 94 | 71 19 43 13 68 84 51 29 16 31 45 94 57 92  7 90 20 55 98 36 64 83 59 10 95
Card  91: 16 74 55 79 95 25 84 61 67 14 | 67 44 80 79 62 81 25 84 61 35 72 78 10 93 14 95 16 45 85 66 74 47  8 29 53
Card  92: 41 74 92 35 88 76  9 79 71 53 | 51 88 44 71 81 49 36 97 35 46 33 62 18  9 85 98 79 76 53 47 41 89 92 63 94
Card  93: 71 11 27 69 65 21 23 25 40 81 | 90 96 34 21 11 55 20 76 44 49 60 75 71 98 27 40 58 63 43 81 18 59 33 88 47
Card  94:  4 39  9 70 63 75 14 99 29 25 | 99 77 91 19 30 94 25 26  1 80 73 32 48 10 61  4  7 31 75 39 70 36 63 51 57
Card  95: 30 24 19 73 42 89 47 66 61 13 | 30 86 52 37 61 25 65 33 32 41 44 92 10 95 59 34 93 39 43 14 73 74 82 13 94
Card  96: 51  3  7 37 96 54  9 83 69 95 | 95 61 28 83 69 22 31 54 51 50 25 29 89 27  4 14 49  3 53  6 59  7 21 30 79
Card  97: 67  5 91 27 33  4 99 15 19 85 | 33 84 51 65 15 67 93 47 94 35 80 11 45 86 69 82 55 85 63 12 29 68 76 61 41
Card  98: 60 64 34 61 95 94 36  2 11 75 | 71 60 39 12 11 51  7 88 64 54  5 90 84 50 26 22 42 36 92 53 67 28 76 58 38
Card  99: 40 77 57 46 19 55 28 31 11 70 | 62 12 45 46 49 32 94 93 13  7 29 66 70 99 37 63 30 52  4 84 54 36  2 11 33
Card 100: 15 18 10 32 26 89 17 78 85 64 | 14 54 15 11 75 45 91 83 88 86 60 62 92  8 29 19 58 79 59 31 93 66 55 46 13
Card 101: 15 44  6 92 88  7 24 20 28 83 | 12 41 95 92 61 16 84 29 31 89 85 97 79 63 54 78 60 27 11 64 72 23 94 52 14
Card 102: 87 56 58  2 25 57 85 83 95 24 | 51 42 58 71 44 62 19 43 27 45  9 13 59 28 93 99  8 31 38 65 32 54 48 97 90
Card 103: 32 37 48 65 94 71 83 31 24 80 | 47 76 28 74 99 46 91 78 21 34 40 20 11 35 88 14 16 55 87 97 52 36 56 90 81
Card 104:  5 35 42 73 55 13 59 81 33  9 | 50 12 81 85 35 82 62 13 73 58 93 59  9 80 68  4 18  7 86  5 33 16 55 65 42
Card 105: 44 69  1 73 91 24 94 64 31 77 | 34 77 39 94 41  9 69 52 95 17 31 74 98 73 42 44 67  1 36 50 21 91 35 64 24
Card 106: 49 69 38 10 46 92 35 50 15 93 | 89 69 27 24 10 46 35 32 15 81 38 67 49 58 91 29 93 92 57 70 68 82 50 86 90
Card 107: 92 57 65 15 23 45 96 56 88 25 | 92 25 15 31 57 56 64 41 87 30 23 78 38 45 28 10 65 71 96 88 27  3 69 91 73
Card 108: 31  1 94 61 10 45 34 11 41 66 |  2 66 38 78 57 88 19 46 35 23 36 59 34 61 10 96 41 45 81  1 94 63 28 12 76
Card 109: 16 72 48 78 77 27 12 36  7 42 | 22 99 23 36 13 53  2 25 72  1 47 48 14 49 69  3 93 44 78 87 38 55 60 52 90
Card 110:  6 80 47 92 32 83 37 53  4 87 | 92  6 41  4 20 91 81 83 40 70  7 87 19 73 63 37 18 47 99 53 80 32 66 45 39
Card 111:  9 72 17 89 28 68 34 63 76 81 | 80 70 22 36 23 61 59  7 53 43 45 67  3 60  6 89 79 95 56 85 31 98 65 39 48
Card 112: 10 23  9 78 98  3 27  6 84 60 | 16 68 84 10 22 50 87  9  5 23 27 74 21 98  3  2 60 85 73  1 26 83  6 89 78
Card 113: 14 90 59 66 86  7 44 10 40 69 | 91 87 14 59 29 40 56 45 11 66 15 90 48 24 62 69 44 79 20 98 76 10 86  7 43
Card 114: 31 90 75 12 34 60 39 74 24  2 | 56 52 85 40  1 14 80 60 42 84 75 18  6 90 76 25 44 74 28 34 13 12 54 48  7
Card 115: 67 42 11 91 53 57 98 17 95 50 | 74 45 25 98 57 66 67 77 69 95 87 79 83 39 96 84 42 91 21  3 53 17 63 50 11
Card 116: 66 36  5 11 33 51 30 67 38  3 | 50 86 36 76 33 77 30 51 11 67 38 26 43 66 39 69 17 90 21  3 16 56 62  5 73
Card 117: 53 34 69  9 10 61 18 23 93 14 | 44  9 69  2 90 14 53 23 21 92 49 72 31 61 46 10 27 70 57 38 18 93 34 67 11
Card 118: 83 89 94 55 65 36 20 79 53 14 | 36 65 41  8 49 29 99 83 94  5 62 78 53 20 68 66 14 89  4 74 48 81 77 52 55
Card 119: 82 69 85 60  9 13 16  3 18 44 | 82 55 85  3  5 80 43 11 13 86 16 31 56 70 17 46 79 69 60 44 95 81 45 49 93
Card 120: 35 53  9 78 73 55 20 64 13 62 |  9 20  3 84 35 71 22 86  8 64 58 82 88 51 54 13 38 68  5 77 81 56 21 74 55
Card 121: 61 34 85 77 66 87 91 49 15 36 | 59 49 46 70 10 94 93 87 36  3 44 66 24 61 95 83 91 75 89 60 81 57 41 85 74
Card 122: 22 90 71 49 34  4 56 74 42  3 | 21 52 19 53 79 34 56 71 95  5 91 14  4 40 78 96 61 42 57 47 73 50 10 74 87
Card 123: 87 49 40 25 31  4 20 48  1 76 | 12  6 43 69 48  2  9 24 95 65 47 57  4 91 94 39 16 62 68  8 23 42 38 59 78
Card 124: 63 38 94 44 69 76 33 89 47 32 |  8 19 96 98 68 24 54 31 28 67 57 73 45 70 64 22 65 50 34 80  6  4 10 78 90
Card 125:  4 48 65 10 93 80 26 23 90 12 | 64 32 40 87 58  3 13 18 86 60 66 71 74  9 61 43 50 99 88 52 95 46 37 22 67
Card 126: 90 71 53 57  5 24  6  3 52  8 | 96 33 13 70 44 27 87 89 81 63 65  8 66 47 31 92 40 53  7 88 99 19 64 38 79
Card 127: 89 68 48 98 32 22 73 79 53 93 | 75 30 35 15 96 64 19  4 14 66 88 85 33 11 43 82 25  1 61 91 94 45  6 78 77
Card 128: 15 39 76 95  5 70  9 23  4 65 | 64 58 90 54 46 42 68 29 11 38 20 92 87 44 98 83 99 27 67 22 13  6 14 43 55
Card 129: 45 83 47 63 64 38 15 95  6 48 | 49 91  6 20 64 56 52 28 55  5 15 54 61 11 71 95 53 57  8 75 27 98 92 13 81
Card 130: 37 14 56 22  7  1  9 76 83 91 | 56 53  1 36 74 37  9 73 70 91 22 77 83 44 68 97 54 39 76  7 65 55 14 34 38
Card 131: 23 92 82 24 86 78 31 98 68 48 | 83 29 28 54 65 47 92 67 94 48 89 49 24  4 59 40 41 82 86 64 38 98 78 66 68
Card 132:  9 63 36 66 29 97 90 20 81 46 | 10 40 43 82  4  9 37 87  3 27 28 54 65  5 50 80  8 31 73 26 88 96 74 23 57
Card 133: 17 48 12 31 13 44 57 45 40 88 | 56 80 55 26  8 16 22 70 13 45 78  7  4 40 10 71 34 32 59 35 69 82 47 88 46
Card 134: 91 87 65  7 49 67 17 60  9 78 | 50 35 40 25 74 62 29 80 21 93 92 52 39 81 51  8 47 65  4 89 83  6 88 87 43
Card 135: 35 87 16  9 34 80 15 81 83 61 | 46 40  8 93 89 67 86 35 71  9 76 95 49 26 22 28 87 90 64 34 79 27 32 59 23
Card 136: 23  1 83 65 67 46 40 97 71 55 | 86  8 79 95  2 59 20 60 31 11 42 97 62 12 67 80 19 55 81 33 13 87 57  9 23
Card 137: 23 99 91  8 79 45 29  3 42 27 | 85 45 65 82 36 76 29 48  8 78 54 79 57 34 70 52  3 96 19 86 12 91 51 59 66
Card 138: 47 48 85 73 89 61 98 39 36  2 | 83 50  1 63 71 30 76 11 93 82 60  4 78 56 66 25 75 33 51 57 28 24 67 74 58
Card 139: 40 41 96 36 71 97 74 78  9 83 | 41 73 51 70 76 22 23 63 56 58 26 91 47 37 88 80 18 67 95 33 11 60 34  7 94
Card 140: 98 32 46 64 18 95 27 65 74 41 | 89 20 42 40 58 84 48 76 67 12 73 44 23 92 90 70 81 71 85 11 83 59 78 22  9
Card 141: 34 18 67 74 52 35 31 27 14 54 | 92 44 48 73 14 51 98 54 88  5 70 65 80 66 84 56  7 40 39 71 94 86 26 25 11
Card 142: 57 53 93 13  4 96 83 23 74 90 | 82 43 42 40 38 87 81 58 44 71 59 50  7  9 30 98 66 80 85 29  1 84 20 26 72
Card 143: 47  3 32 53 72 82 44 64 85 24 |  2 71 98 94 62 23 87 68 93 86 70 96 19 84 74 15 95 42 29 90  6 54 67 30 61
Card 144: 74 46  9 94 60 86 56 40 34 57 | 66 55 16 95  5 25 75 90 47 76 54 93 61 23 37 89 64 48 42 30 18 31  3 97 27
Card 145: 57 25 17 78  1 63 31  3 65 23 | 39 95 13 65  3 27 17 85 56 47 10  8 63 51 23 25 40 22 54 78 81 62 90  4 50
Card 146: 54 71  5 68 25 76 33 31 32 64 | 99 75 87 61 32 91 47 71 11 51 43 36 33 83  3 63 35 42 16 31 81 28 86 22 90
Card 147: 22 98 86 67 26 72 31 52 93 20 | 87 42 20 49 43 35 27 52 56 86 40 22 29 59 76 26  9 93 30 58 67 31 72 33 98
Card 148: 47 81 86  1 87 63 16 58 98 26 | 34 15  7 39 47 86 21 14 81 49 87 43 91 24 73 63 18 98 37 29 77 53 67 26 19
Card 149: 24 21 62 66 80 31 50 23 13 54 | 47  6 13 90 54 49 66 74 62 34  4 95 23 55 50 45 18 59 61 21 26 75 39 80 24
Card 150: 14 97  9 69 44 64 63 22  8 89 | 71 65 32 59 28 43 97 48  6 70 45 75 63 99 60 39 20 78 95 47 55  1 74 58 13
Card 151: 93 73 94 83 23 50 68 40 18 13 | 76 70 83  7  4 23 82 29 78 40 93 77 66 94 92 68 18  2 15 49 17 39 37 35 64
Card 152: 73  6 44 81  1 39 61 34  7 23 | 32 81 85 42 23 40 97 74 55 46 39  2 79 86 91  3 37 33 76 58 77 88 75 12 53
Card 153: 15 19 22 66  3 50 77 97 21 62 | 66 59 27 78  6 28 54 13 32 70 23 51 48 50 17 43 42 21 22 34 16 64  3 37 74
Card 154: 10 17 93 15 92  4 22  2 44 88 | 60 69 90 85 19 13 88 11 84 39 68 33 14 27 95  2 53 87 66 82 74 36 41 42 46
Card 155: 74 88 14 39 78 54 60 75 11 65 | 64 14 66 16 18 81 20 36  3 82  8 62 34 87 43 53 80 96 59 39 78  5 40 13 21
Card 156: 25  5 87 20 51 57 61 39 16 83 | 37 63 60 79 83 52 81 99 92 26 70 76 56  8 73 98  5 48  1 46 16 86 28 12 78
Card 157: 45  7 33 97 91 59 10 77  2 82 | 98 10  1 28  4 37 69 92 99 58 40 42 34 38 26 81  3 18 84 45 31 20 55 36 44
Card 158: 98 33 35 10 56 43 60 68 25 62 | 61 89 80 40  2 26  3 13 57 10 96 71 86 27 78 87 59 37 45 75 79 46 49 36 66
Card 159: 12 31 72 74 90 88 58 73 25  9 | 51 71 23 44  5 34 82 33 55 49 68 39 20 93 13 97 81 14  2 91 76 75 50 95  7
Card 160: 38 23 46  5 85 22 26 81 91 93 | 85 38 22 58 19  3 89 35 84 46 18 53 95 91 47 93 99 33 81 68 57 49 80 71 23
Card 161: 57 14 48 68 72 81 93 61 43 40 |  6  5 47 59 11 81 13 38 52 26 91 22 57 55 35 19 61  2 29 93 14 74 53 45 60
Card 162: 20 52  9 61 26 94 11 84 28 37 | 39  9 88 48 73 14 24 29 28 37 31 27 95 79 98 26 45 11 96 68 47 58 35 62 52
Card 163: 11 42 60 15 27 43 13 17 72 98 | 12 74 81 37 95 20 86 42 72 79 66 89 62 63 38 73 65 82  8 28 50 70 78 15 94
Card 164: 88 38 30  3 48 17 19 68 73  2 | 13 71 34 83 40 38 59 12 73  2 91 52 60 19 87 84  1 82 65  3  8 99 80 79 70
Card 165: 22 62 51 13 76 17 26 41 46 34 | 93 50 94 18 84 39 48 75 59  3 44 67 37 32 55 82 79 14  7 86 61 27 31 74 42
Card 166: 27 80 73 77 72 18 83 97 53  3 |  6 74 34 22 75 60 99 17 47 12 29 64 48 67 15 14 63 13 19 49  5 89 42  9 11
Card 167: 14 31 99 33 53 52 98 95 49 73 | 95 92 60 18 19 39 90 31 10 58  7  6 59 51 73 22 45 49  4 21 67 76 78 56 20
Card 168: 11 78 93 57 58 47 40 22 23 85 |  6 27 66 43 57  2 90 49 25 60 99 19 36 22 47 80  1 32 21 87 98 58 93  9 76
Card 169: 99 40 75 47 22 83 41 50 18 51 | 94 74 86 14 12  5 78 61 89 17  8 83 30 90 51 87 53 43 41 27 13 92 26 49 76
Card 170: 23 16 36 32 91 52 73 53 18 83 | 90 76 24 97 95 62 39 70  3 52 63 30 19 75 96 82  9 71 81 64 22 84 99 35 21
Card 171: 38 27 53 94 16 71 18  6 83 17 | 76  3 78 23 31 19 50 22 57 97 39 35 56 51 83 94 55 85  1  5 12 43 86 58 46
Card 172: 45 79 25 86 56 50 20 18 97 52 | 40 85 90 28 97 43  4  3 22 76 21 61 16 62 95 29 83 44 15 12 56 34 53 36 93
Card 173:  1 79 49 77 62 33 84 76  7 50 | 29  6 42 56 67 47 94 25 97 48 86 43  3 18 51 21 93 16 95 14 15 82 71 87 75
Card 174: 83 64 11 39 24 97 35 54 27 60 | 22 16 31 92 42 94 72 62 58  5 69  8 28 33 89 47 23 52 90 57 68 80  9 96  7
Card 175: 87 10 42 65 40 51 31 45 48 89 | 75 37 60 71 76 92 10 29 14 63 81 34 94 88 32 91  6 82 79 90 53 89 68 49 26
Card 176: 96 83 15 50 17 16 81 85 11 35 | 31 17  8 30 33 47 11 15 41 73 99 40 70 48 91 26 96 60 39 95 52 59 45 23 50
Card 177: 64 51 20 97 68 69 57 58 34 12 | 54 82 32 79 89 70 47 52 16 36 83 10 49  8 18 94 73 77 48 42 19 98 55 75 80
Card 178: 36  1 53 62 73 77 52 59 51  3 | 59 35 68  1 45 77  4 79 83 16 36 63 99 53 52  3 73 51 13 89 84 32 64 33 62
Card 179: 30 70 61  7 29 52 97 81 65 59 | 48  5 42 71 88 89 93 64 37 28 26 25 90 94 92 21 50  6 19 33 68 66 78  1 15
Card 180: 66  3 33 16 57 41 91 83 48 68 | 58 68 33 80 42 13 69 78 16 83 18 41 34 35 79 48 66 62 86 90  2  6 96 57 91
Card 181: 86 94 43 29 75 78 42 95 13 10 | 42 88 43 13 60 52 47 86 87 59 95 72  8 23 82  2 69 61 14 71 94 90 30 85 51
Card 182: 73 90 84 14 52 15 98 43  3 23 | 84  8 11 64 83 62 77 18 53 81 19 47  1 79 99 41 40 74 93 89 20 72 49 26 38
Card 183: 24 78 51 40 92 66 77 39 97 68 | 38 70 63  5 19 21 95 73 64 14 55 80 23 22 77 65 74 97 37 26 82 83  9 52 60
Card 184: 98 12 62 53 69 27 84 64 91 94 | 19  9 90 98 43 26  7 12 68 16 10 45 20 23  4 63  3 38 77  6 27  8 91 70 60
Card 185: 32 37  2 76 75 62 39 33 12 13 | 11 29 49 77 50 97 65 87 25 91 10 21 15 82 95 99 80 71 54 42 48 78 72 63 34
Card 186: 55 49 21 41 83 40 29 51 54 57 | 20 88 52 62 85 90 25 45 54 58 72 91 98 14 13 28 74 92 31  8 42  3 26 11 59
Card 187: 95 43 56 46 98 96 55 31 28 50 | 23  5 13 35 95 37  1 89 76 45 68 73 52 15 26  3 38 36 99 51 80  8 63 77 28
Card 188: 84 71 30 79  6 13 57  3 63 55 | 46 45 43 26 48 47 37 35 88 13 59  9 95 86 49 98 64 62 54 44 22 92 25  3 15
Card 189: 56 94 93 30 27 53 85 58  4 91 | 86 70  1 96 60 92 66 33  9 50 78 41 67 55  7 28 89 31 14 19 76 42 71 82 63
Card 190: 17 27 42 70 11 38 47 58 92 88 | 73 15 86 13 25 64 58  4 61 95 36 41 94 17 72 90 22  6 56 98 35 45 60 19 33
Card 191: 19 96 44 57 88 39  7 67 85 89 | 49 31 15 98 77 14 43 59 85  2 79 71 69 81 95 93 33 66 25 87 65 13 62 46 91
Card 192: 29 77 54 66 79  7 88 72 99 35 | 50 94 48 18 60 56 74 59 97  5 87  8 70 93 81 27 14 57 25 22 71 63 83 44 15
'@

$testcase = @'
Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11
'@

function Get-Step2() {
    [CmdletBinding()]
    param (
        [Parameter(ValueFromPipeline=$true)][Object]$InputObject
    )
    begin {}
    process {}
    end {}
}

function Invoke-Part1($textinput) {
    $lines = $textinput.Split("`n")
    $i = 0
    $lines
    | ForEach-Object {
        $lineSplit = $_.Split(":")
        $cardId = $lineSplit[0].Split(" ")[1]
        $winning = $lineSplit[1].Split("|")[0].Split(" ", [StringSplitOptions]::RemoveEmptyEntries)
        $youHave = $lineSplit[1].Split("|")[1].Split(" ", [StringSplitOptions]::RemoveEmptyEntries)
        [PSCustomObject]@{
            Id = $cardId
            Winning = $winning
            YouHave = $youHave
        }
    }
    | ForEach-Object {
        $card = $_
        $_ | Add-Member -MemberType NoteProperty -Name Matches -Value (
            Compare-Object `
                -ExcludeDifferent `
                -ReferenceObject $card.YouHave `
                -DifferenceObject $card.Winning
            | Select-Object -ExpandProperty InputObject
        )
        $_
    }
    | ForEach-Object {
        $card = $_
        $score = 0
        $worth = 1
        $card.Matches
        | ForEach-Object {
            if ($card.Matches.Count -gt 0) {
                if ($score -gt 0) {$score *=2}
                if ($score -eq 0) {$score = 1}
            }
        }
        $_ | Add-Member -MemberType NoteProperty -Name Score -Value (
            $score
        )
        $_
    }
    | Measure-Object -Property Score -Sum
}

Invoke-Part1 -textinput $textinput