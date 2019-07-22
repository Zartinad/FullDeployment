module.exports = {
  apps : [{
      name:'load_config',
      script:'./load_config.js',
       env: {
      NODE_ENV: 'development',
      DB_USER:'app',
      DB_HOST:'localhost',
      DB_PASS:'adam',
      DB_DATABASE:'live',
    }

  },{
    name: 'server',
    script: "npm",
    args : "start server.js",
    // script: './server.js',

    // Options reference: https://pm2.io/doc/en/runtime/reference/ecosystem-file/
    // args: 'one two',
    instances: 1,
    autorestart: true,
    watch: false,
    max_memory_restart: '1G',
    env: {
      NODE_ENV: 'development',
      DB_USER:'app',
      DB_HOST:'localhost',
      DB_PASS:'adam',
      DB_DATABASE:'live',
      INVESTMENT_ACNT:'investment_user',
      RAKE_ACNT:'rake_user'
      FX_ACNT:<fx_acnt_username>,
      WITHDRAWAL_FEES_ACNT:<withdrawal_anct_username>,
      BTC_PAY_HOST:<bitcoin_payment_ip>,
      BTC_PAY_PORT:<bitcoin_payment_port>,
      BTC_PAY_RPC_USER:<bitcoin_payment_rpc_user>,
      BTC_PAY_RPC_PASS:<bitcoin_payment_rpc_pass>,
      CLAM_PAY_HOST:<clamcoin_payment_ip>,
      CLAM_PAY_PORT:<clamcoin_payment_port>,
      CLAM_PAY_RPC_USER:<clamcoin_payment_rpc_user>,
      CLAM_PAY_RPC_PASS:<clamcoin_payment_rpc_pass>

    },
    env_production: {
      NODE_ENV: 'production',
      DB_USER:'app',
      DB_HOST:'localhost',
      DB_PASS:'adam',
      DB_DATABASE:'live',
      INVESTMENT_ACNT:'investment_user',
      RAKE_ACNT:'rake_user'
      FX_ACNT:<fx_acnt_username>,
      WITHDRAWAL_FEES_ACNT:<withdrawal_anct_username>,
      BTC_PAY_HOST:<bitcoin_payment_ip>,
      BTC_PAY_PORT:<bitcoin_payment_port>,
      BTC_PAY_RPC_USER:<bitcoin_payment_rpc_user>,
      BTC_PAY_RPC_PASS:<bitcoin_payment_rpc_pass>,
      CLAM_PAY_HOST:<clamcoin_payment_ip>,
      CLAM_PAY_PORT:<clamcoin_payment_port>,
      CLAM_PAY_RPC_USER:<clamcoin_payment_rpc_user>,
      CLAM_PAY_RPC_PASS:<clamcoin_payment_rpc_pass>
    }
  }]
};