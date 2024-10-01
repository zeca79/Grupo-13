LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY absolute IS
    GENERIC (N : POSITIVE := 8);
    PORT (
        a : IN  std_logic_vector (N-1 DOWNTO 0);  -- Entrada de N bits com sinal
        s : OUT std_logic_vector (N-2 DOWNTO 0)   -- Saída de N-1 bits sem sinal (valor absoluto)
    );
END absolute;

ARCHITECTURE arch OF absolute IS
    SIGNAL a_signed : signed(N-1 DOWNTO 0);      -- Conversão da entrada para tipo signed
    SIGNAL abs_value : unsigned(N-2 DOWNTO 0);   -- Valor absoluto como unsigned
BEGIN
    -- Conversão da entrada de std_logic_vector para signed
    a_signed <= signed(a);

    PROCESS (a_signed)
    BEGIN
        -- Se o número for negativo, aplica complemento de 2
        IF a_signed(N-1) = '1' THEN
            abs_value <= unsigned(not a_signed(N-2 DOWNTO 0) + 1); -- complemento de 2
        ELSE
            -- Se for positivo, mantém o valor
            abs_value <= unsigned(a_signed(N-2 DOWNTO 0));
        END IF;
    END PROCESS;

    -- Atribui o valor absoluto à saída
    s <= std_logic_vector(abs_value);
END arch;
