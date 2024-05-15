# What test application versions to run (names of WAR files in tbuis directory)
RUN_CONTAINERS = [
    "defect-00_free.war",
    "defect-02-C0.H0.M0.L1_S_S_03.war",
    "defect-04-C0.H0.M0.L1_S_S_04.war",
    "defect-18-C0.H1.M0.L0_S_S_06.war",
    "defect-19-C0.H1.M0.L0_S_S_10.war",
    "defect-20-C0.H1.M0.L0_T_S_02.war",
    "defect-22-C1.H0.M0.L0_S_S_11.war",
    "defect-21-C0.H1.M0.L0_T_S_04.war",
    "defect-23-C1.H0.M0.L0_T_S_03.war",
    "defect-24-C1.H0.M0.L0_T_S_06.war",
    "defect-25-C1.H0.M0.L0_S_S_01.war",
    "defect-26-C1.H0.M0.L0_T_S_01.war",
    "defect-27-C1.H0.M0.L0_U_D_01.war",
    "defect-28-C2.H2.M1.L0_M_CR.war"
]

# On which application version is expected failure for given test specification
POSITIVE_FAILS = {
    "1": ["defect-02-C0.H0.M0.L1_S_S_03.war"],
    "4": ["defect-04-C0.H0.M0.L1_S_S_04.war", "defect-19-C0.H1.M0.L0_S_S_10.war", "defect-25-C1.H0.M0.L0_S_S_01.war", "defect-26-C1.H0.M0.L0_T_S_01.war", "defect-28-C2.H2.M1.L0_M_CR.war"],
    "6": ["defect-25-C1.H0.M0.L0_S_S_01.war", "defect-26-C1.H0.M0.L0_T_S_01.war", "defect-28-C2.H2.M1.L0_M_CR.war"],
    "8": ["defect-22-C1.H0.M0.L0_S_S_11.war", "defect-25-C1.H0.M0.L0_S_S_01.war", "defect-26-C1.H0.M0.L0_T_S_01.war", "defect-28-C2.H2.M1.L0_M_CR.war"],
    "9": [],
    "10": ["defect-26-C1.H0.M0.L0_T_S_01.war", "defect-28-C2.H2.M1.L0_M_CR.war"],
    "11": ["defect-26-C1.H0.M0.L0_T_S_01.war", "defect-28-C2.H2.M1.L0_M_CR.war"],
    "12": ["defect-20-C0.H1.M0.L0_T_S_02.war", "defect-21-C0.H1.M0.L0_T_S_04.war", "defect-23-C1.H0.M0.L0_T_S_03.war", "defect-26-C1.H0.M0.L0_T_S_01.war", "defect-28-C2.H2.M1.L0_M_CR.war"],
    "17": ["defect-18-C0.H1.M0.L0_S_S_06.war", "defect-24-C1.H0.M0.L0_T_S_06.war", "defect-25-C1.H0.M0.L0_S_S_01.war", "defect-26-C1.H0.M0.L0_T_S_01.war","defect-27-C1.H0.M0.L0_U_D_01.war", "defect-28-C2.H2.M1.L0_M_CR.war"],
    "18": ["defect-27-C1.H0.M0.L0_U_D_01.war", "defect-28-C2.H2.M1.L0_M_CR.war"],
}
