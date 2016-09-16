# WARNING ABOUT GENERATED CODE
#
# This file is generated. See the contributing for info on making contributions:
# https://github.com/aws/aws-sdk-ruby/blob/master/CONTRIBUTING.md
#
# WARNING ABOUT GENERATED CODE

require 'seahorse/client/plugins/content_length.rb'
require 'aws-sdk-core/plugins/logging.rb'
require 'aws-sdk-core/plugins/param_converter.rb'
require 'aws-sdk-core/plugins/param_validator.rb'
require 'aws-sdk-core/plugins/user_agent.rb'
require 'aws-sdk-core/plugins/helpful_socket_errors.rb'
require 'aws-sdk-core/plugins/retry_errors.rb'
require 'aws-sdk-core/plugins/global_configuration.rb'
require 'aws-sdk-core/plugins/regional_endpoint.rb'
require 'aws-sdk-core/plugins/request_signer.rb'
require 'aws-sdk-core/plugins/response_paging.rb'
require 'aws-sdk-core/plugins/stub_responses.rb'
require 'aws-sdk-core/plugins/protocols/rest_json.rb'
require 'aws-sdk-glacier/plugins/account_id.rb'
require 'aws-sdk-glacier/plugins/api_version.rb'
require 'aws-sdk-glacier/plugins/checksums.rb'

module Aws
  module Glacier
    class Client < Seahorse::Client::Base

      include Aws::ClientStubs
      include Aws::ClientWaiters

      @identifier = :glacier

      set_api(ClientApi::API)

      add_plugin(Seahorse::Client::Plugins::ContentLength)
      add_plugin(Aws::Plugins::Logging)
      add_plugin(Aws::Plugins::ParamConverter)
      add_plugin(Aws::Plugins::ParamValidator)
      add_plugin(Aws::Plugins::UserAgent)
      add_plugin(Aws::Plugins::HelpfulSocketErrors)
      add_plugin(Aws::Plugins::RetryErrors)
      add_plugin(Aws::Plugins::GlobalConfiguration)
      add_plugin(Aws::Plugins::RegionalEndpoint)
      add_plugin(Aws::Plugins::RequestSigner)
      add_plugin(Aws::Plugins::ResponsePaging)
      add_plugin(Aws::Plugins::StubResponses)
      add_plugin(Aws::Plugins::Protocols::RestJson)
      add_plugin(Aws::Glacier::Plugins::AccountId)
      add_plugin(Aws::Glacier::Plugins::ApiVersion)
      add_plugin(Aws::Glacier::Plugins::Checksums)

      # @option options [required, Aws::CredentialProvider] :credentials
      #   Your AWS credentials. This can be an instance of any one of the
      #   following classes:
      #
      #   * `Aws::Credentials` - Used for configuring static, non-refreshing
      #     credentials.
      #
      #   * `Aws::InstanceProfileCredentials` - Used for loading credentials
      #     from an EC2 IMDS on an EC2 instance.
      #
      #   * `Aws::SharedCredentials` - Used for loading credentials from a
      #     shared file, such as `~/.aws/config`.
      #
      #   * `Aws::AssumeRoleCredentials` - Used when you need to assume a role.
      #
      #   When `:credentials` are not configured directly, the following
      #   locations will be searched for credentials:
      #
      #   * `Aws.config[:credentials]`
      #   * The `:access_key_id`, `:secret_access_key`, and `:session_token` options.
      #   * ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']
      #   * `~/.aws/credentials`
      #   * `~/.aws/config`
      #   * EC2 IMDS instance profile - When used by default, the timeouts are
      #     very aggressive. Construct and pass an instance of
      #     `Aws::InstanceProfileCredentails` to enable retries and extended
      #     timeouts.
      # @option options [required, String] :region
      #   The AWS region to connect to.  The configured `:region` is
      #   used to determine the service `:endpoint`. When not passed,
      #   a default `:region` is search for in the following locations:
      #
      #   * `Aws.config[:region]`
      #   * `ENV['AWS_REGION']`
      #   * `ENV['AMAZON_REGION']`
      #   * `ENV['AWS_DEFAULT_REGION']`
      #   * `~/.aws/credentials`
      #   * `~/.aws/config`
      # @option options [String] :access_key_id
      # @option options [String] :account_id ("-")
      #   The default Glacier AWS account ID to use for all glacier
      #   operations. The default value of `-` uses the account
      #   your `:credentials` belong to.
      # @option options [Boolean] :convert_params (true)
      #   When `true`, an attempt is made to coerce request parameters into
      #   the required types.
      # @option options [String] :endpoint
      #   The client endpoint is normally constructed from the `:region`
      #   option. You should only configure an `:endpoint` when connecting
      #   to test endpoints. This should be avalid HTTP(S) URI.
      # @option options [Aws::Log::Formatter] :log_formatter (Aws::Log::Formatter.default)
      #   The log formatter.
      # @option options [Symbol] :log_level (:info)
      #   The log level to send messages to the `:logger` at.
      # @option options [Logger] :logger
      #   The Logger instance to send log messages to.  If this option
      #   is not set, logging will be disabled.
      # @option options [String] :profile ("default")
      #   Used when loading credentials from the shared credentials file
      #   at HOME/.aws/credentials.  When not specified, 'default' is used.
      # @option options [Integer] :retry_limit (3)
      #   The maximum number of times to retry failed requests.  Only
      #   ~ 500 level server errors and certain ~ 400 level client errors
      #   are retried.  Generally, these are throttling errors, data
      #   checksum errors, networking errors, timeout errors and auth
      #   errors from expired credentials.
      # @option options [String] :secret_access_key
      # @option options [String] :session_token
      # @option options [Boolean] :stub_responses (false)
      #   Causes the client to return stubbed responses. By default
      #   fake responses are generated and returned. You can specify
      #   the response data to return or errors to raise by calling
      #   {ClientStubs#stub_responses}. See {ClientStubs} for more information.
      #
      #   ** Please note ** When response stubbing is enabled, no HTTP
      #   requests are made, and retries are disabled.
      # @option options [Boolean] :validate_params (true)
      #   When `true`, request parameters are validated before
      #   sending the request.
      def initialize(*args)
        super
      end

      # @!group API Operations

      # This operation aborts a multipart upload identified by the upload ID.
      #
      # After the Abort Multipart Upload request succeeds, you cannot upload
      # any more parts to the multipart upload or complete the multipart
      # upload. Aborting a completed upload fails. However, aborting an
      # already-aborted upload will succeed, for a short time. For more
      # information about uploading a part and completing a multipart upload,
      # see UploadMultipartPart and CompleteMultipartUpload.
      #
      # This operation is idempotent.
      #
      # An AWS account has full permission to perform all operations
      # (actions). However, AWS Identity and Access Management (IAM) users
      # don\'t have any permissions by default. You must grant them explicit
      # permission to perform specific actions. For more information, see
      # [Access Control Using AWS Identity and Access Management (IAM)][1].
      #
      # For conceptual information and underlying REST API, go to [Working
      # with Archives in Amazon Glacier][2] and [Abort Multipart Upload][3] in
      # the *Amazon Glacier Developer Guide*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html
      # [2]: http://docs.aws.amazon.com/amazonglacier/latest/dev/working-with-archives.html
      # [3]: http://docs.aws.amazon.com/amazonglacier/latest/dev/api-multipart-abort-upload.html
      # @option params [required, String] :account_id
      #   The `AccountId` value is the AWS account ID of the account that owns
      #   the vault. You can either specify an AWS account ID or optionally a
      #   single apos`-`apos (hyphen), in which case Amazon Glacier uses the AWS
      #   account ID associated with the credentials used to sign the request.
      #   If you use an account ID, do not include any hyphens (apos-apos) in
      #   the ID.
      # @option params [required, String] :vault_name
      #   The name of the vault.
      # @option params [required, String] :upload_id
      #   The upload ID of the multipart upload to delete.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.abort_multipart_upload({
      #     account_id: "string", # required
      #     vault_name: "string", # required
      #     upload_id: "string", # required
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def abort_multipart_upload(params = {}, options = {})
        req = build_request(:abort_multipart_upload, params)
        req.send_request(options)
      end

      # This operation aborts the vault locking process if the vault lock is
      # not in the `Locked` state. If the vault lock is in the `Locked` state
      # when this operation is requested, the operation returns an
      # `AccessDeniedException` error. Aborting the vault locking process
      # removes the vault lock policy from the specified vault.
      #
      # A vault lock is put into the `InProgress` state by calling
      # InitiateVaultLock. A vault lock is put into the `Locked` state by
      # calling CompleteVaultLock. You can get the state of a vault lock by
      # calling GetVaultLock. For more information about the vault locking
      # process, see [Amazon Glacier Vault Lock][1]. For more information
      # about vault lock policies, see [Amazon Glacier Access Control with
      # Vault Lock Policies][2].
      #
      # This operation is idempotent. You can successfully invoke this
      # operation multiple times, if the vault lock is in the `InProgress`
      # state or if there is no policy associated with the vault.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/amazonglacier/latest/dev/vault-lock.html
      # [2]: http://docs.aws.amazon.com/amazonglacier/latest/dev/vault-lock-policy.html
      # @option params [required, String] :account_id
      #   The `AccountId` value is the AWS account ID. This value must match the
      #   AWS account ID associated with the credentials used to sign the
      #   request. You can either specify an AWS account ID or optionally a
      #   single apos`-`apos (hyphen), in which case Amazon Glacier uses the AWS
      #   account ID associated with the credentials used to sign the request.
      #   If you specify your account ID, do not include any hyphens (apos-apos)
      #   in the ID.
      # @option params [required, String] :vault_name
      #   The name of the vault.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.abort_vault_lock({
      #     account_id: "string", # required
      #     vault_name: "string", # required
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def abort_vault_lock(params = {}, options = {})
        req = build_request(:abort_vault_lock, params)
        req.send_request(options)
      end

      # This operation adds the specified tags to a vault. Each tag is
      # composed of a key and a value. Each vault can have up to 10 tags. If
      # your request would cause the tag limit for the vault to be exceeded,
      # the operation throws the `LimitExceededException` error. If a tag
      # already exists on the vault under a specified key, the existing key
      # value will be overwritten. For more information about tags, see
      # [Tagging Amazon Glacier Resources][1].
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/amazonglacier/latest/dev/tagging.html
      # @option params [required, String] :account_id
      #   The `AccountId` value is the AWS account ID of the account that owns
      #   the vault. You can either specify an AWS account ID or optionally a
      #   single apos`-`apos (hyphen), in which case Amazon Glacier uses the AWS
      #   account ID associated with the credentials used to sign the request.
      #   If you use an account ID, do not include any hyphens (apos-apos) in
      #   the ID.
      # @option params [required, String] :vault_name
      #   The name of the vault.
      # @option params [Hash<String,String>] :tags
      #   The tags to add to the vault. Each tag is composed of a key and a
      #   value. The value can be an empty string.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.add_tags_to_vault({
      #     account_id: "string", # required
      #     vault_name: "string", # required
      #     tags: {
      #       "TagKey" => "TagValue",
      #     },
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def add_tags_to_vault(params = {}, options = {})
        req = build_request(:add_tags_to_vault, params)
        req.send_request(options)
      end

      # You call this operation to inform Amazon Glacier that all the archive
      # parts have been uploaded and that Amazon Glacier can now assemble the
      # archive from the uploaded parts. After assembling and saving the
      # archive to the vault, Amazon Glacier returns the URI path of the newly
      # created archive resource. Using the URI path, you can then access the
      # archive. After you upload an archive, you should save the archive ID
      # returned to retrieve the archive at a later point. You can also get
      # the vault inventory to obtain a list of archive IDs in a vault. For
      # more information, see InitiateJob.
      #
      # In the request, you must include the computed SHA256 tree hash of the
      # entire archive you have uploaded. For information about computing a
      # SHA256 tree hash, see [Computing Checksums][1]. On the server side,
      # Amazon Glacier also constructs the SHA256 tree hash of the assembled
      # archive. If the values match, Amazon Glacier saves the archive to the
      # vault; otherwise, it returns an error, and the operation fails. The
      # ListParts operation returns a list of parts uploaded for a specific
      # multipart upload. It includes checksum information for each uploaded
      # part that can be used to debug a bad checksum issue.
      #
      # Additionally, Amazon Glacier also checks for any missing content
      # ranges when assembling the archive, if missing content ranges are
      # found, Amazon Glacier returns an error and the operation fails.
      #
      # Complete Multipart Upload is an idempotent operation. After your first
      # successful complete multipart upload, if you call the operation again
      # within a short period, the operation will succeed and return the same
      # archive ID. This is useful in the event you experience a network issue
      # that causes an aborted connection or receive a 500 server error, in
      # which case you can repeat your Complete Multipart Upload request and
      # get the same archive ID without creating duplicate archives. Note,
      # however, that after the multipart upload completes, you cannot call
      # the List Parts operation and the multipart upload will not appear in
      # List Multipart Uploads response, even if idempotent complete is
      # possible.
      #
      # An AWS account has full permission to perform all operations
      # (actions). However, AWS Identity and Access Management (IAM) users
      # don\'t have any permissions by default. You must grant them explicit
      # permission to perform specific actions. For more information, see
      # [Access Control Using AWS Identity and Access Management (IAM)][2].
      #
      # For conceptual information and underlying REST API, go to [Uploading
      # Large Archives in Parts (Multipart Upload)][3] and [Complete Multipart
      # Upload][4] in the *Amazon Glacier Developer Guide*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/amazonglacier/latest/dev/checksum-calculations.html
      # [2]: http://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html
      # [3]: http://docs.aws.amazon.com/amazonglacier/latest/dev/uploading-archive-mpu.html
      # [4]: http://docs.aws.amazon.com/amazonglacier/latest/dev/api-multipart-complete-upload.html
      # @option params [required, String] :account_id
      #   The `AccountId` value is the AWS account ID of the account that owns
      #   the vault. You can either specify an AWS account ID or optionally a
      #   single apos`-`apos (hyphen), in which case Amazon Glacier uses the AWS
      #   account ID associated with the credentials used to sign the request.
      #   If you use an account ID, do not include any hyphens (apos-apos) in
      #   the ID.
      # @option params [required, String] :vault_name
      #   The name of the vault.
      # @option params [required, String] :upload_id
      #   The upload ID of the multipart upload.
      # @option params [Integer] :archive_size
      #   The total size, in bytes, of the entire archive. This value should be
      #   the sum of all the sizes of the individual parts that you uploaded.
      # @option params [String] :checksum
      #   The SHA256 tree hash of the entire archive. It is the tree hash of
      #   SHA256 tree hash of the individual parts. If the value you specify in
      #   the request does not match the SHA256 tree hash of the final assembled
      #   archive as computed by Amazon Glacier, Amazon Glacier returns an error
      #   and the request fails.
      # @return [Types::ArchiveCreationOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::ArchiveCreationOutput#location #location} => String
      #   * {Types::ArchiveCreationOutput#checksum #checksum} => String
      #   * {Types::ArchiveCreationOutput#archive_id #archiveId} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.complete_multipart_upload({
      #     account_id: "string", # required
      #     vault_name: "string", # required
      #     upload_id: "string", # required
      #     archive_size: 1,
      #     checksum: "string",
      #   })
      #
      # @example Response structure
      #   resp.location #=> String
      #   resp.checksum #=> String
      #   resp.archive_id #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def complete_multipart_upload(params = {}, options = {})
        req = build_request(:complete_multipart_upload, params)
        req.send_request(options)
      end

      # This operation completes the vault locking process by transitioning
      # the vault lock from the `InProgress` state to the `Locked` state,
      # which causes the vault lock policy to become unchangeable. A vault
      # lock is put into the `InProgress` state by calling InitiateVaultLock.
      # You can obtain the state of the vault lock by calling GetVaultLock.
      # For more information about the vault locking process, [Amazon Glacier
      # Vault Lock][1].
      #
      # This operation is idempotent. This request is always successful if the
      # vault lock is in the `Locked` state and the provided lock ID matches
      # the lock ID originally used to lock the vault.
      #
      # If an invalid lock ID is passed in the request when the vault lock is
      # in the `Locked` state, the operation returns an
      # `AccessDeniedException` error. If an invalid lock ID is passed in the
      # request when the vault lock is in the `InProgress` state, the
      # operation throws an `InvalidParameter` error.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/amazonglacier/latest/dev/vault-lock.html
      # @option params [required, String] :account_id
      #   The `AccountId` value is the AWS account ID. This value must match the
      #   AWS account ID associated with the credentials used to sign the
      #   request. You can either specify an AWS account ID or optionally a
      #   single apos`-`apos (hyphen), in which case Amazon Glacier uses the AWS
      #   account ID associated with the credentials used to sign the request.
      #   If you specify your account ID, do not include any hyphens (apos-apos)
      #   in the ID.
      # @option params [required, String] :vault_name
      #   The name of the vault.
      # @option params [required, String] :lock_id
      #   The `lockId` value is the lock ID obtained from a InitiateVaultLock
      #   request.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.complete_vault_lock({
      #     account_id: "string", # required
      #     vault_name: "string", # required
      #     lock_id: "string", # required
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def complete_vault_lock(params = {}, options = {})
        req = build_request(:complete_vault_lock, params)
        req.send_request(options)
      end

      # This operation creates a new vault with the specified name. The name
      # of the vault must be unique within a region for an AWS account. You
      # can create up to 1,000 vaults per account. If you need to create more
      # vaults, contact Amazon Glacier.
      #
      # You must use the following guidelines when naming a vault.
      #
      # * Names can be between 1 and 255 characters long.
      #
      # * Allowed characters are a-z, A-Z, 0-9, \'\_\' (underscore), \'-\'
      #   (hyphen), and \'.\' (period).
      #
      # This operation is idempotent.
      #
      # An AWS account has full permission to perform all operations
      # (actions). However, AWS Identity and Access Management (IAM) users
      # don\'t have any permissions by default. You must grant them explicit
      # permission to perform specific actions. For more information, see
      # [Access Control Using AWS Identity and Access Management (IAM)][1].
      #
      # For conceptual information and underlying REST API, go to [Creating a
      # Vault in Amazon Glacier][2] and [Create Vault ][3] in the *Amazon
      # Glacier Developer Guide*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html
      # [2]: http://docs.aws.amazon.com/amazonglacier/latest/dev/creating-vaults.html
      # [3]: http://docs.aws.amazon.com/amazonglacier/latest/dev/api-vault-put.html
      # @option params [required, String] :account_id
      #   The `AccountId` value is the AWS account ID. This value must match the
      #   AWS account ID associated with the credentials used to sign the
      #   request. You can either specify an AWS account ID or optionally a
      #   single apos`-`apos (hyphen), in which case Amazon Glacier uses the AWS
      #   account ID associated with the credentials used to sign the request.
      #   If you specify your account ID, do not include any hyphens (apos-apos)
      #   in the ID.
      # @option params [required, String] :vault_name
      #   The name of the vault.
      # @return [Types::CreateVaultOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::CreateVaultOutput#location #location} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.create_vault({
      #     account_id: "string", # required
      #     vault_name: "string", # required
      #   })
      #
      # @example Response structure
      #   resp.location #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def create_vault(params = {}, options = {})
        req = build_request(:create_vault, params)
        req.send_request(options)
      end

      # This operation deletes an archive from a vault. Subsequent requests to
      # initiate a retrieval of this archive will fail. Archive retrievals
      # that are in progress for this archive ID may or may not succeed
      # according to the following scenarios:
      #
      # * If the archive retrieval job is actively preparing the data for
      #   download when Amazon Glacier receives the delete archive request,
      #   the archival retrieval operation might fail.
      # * If the archive retrieval job has successfully prepared the archive
      #   for download when Amazon Glacier receives the delete archive
      #   request, you will be able to download the output.
      #
      # This operation is idempotent. Attempting to delete an already-deleted
      # archive does not result in an error.
      #
      # An AWS account has full permission to perform all operations
      # (actions). However, AWS Identity and Access Management (IAM) users
      # don\'t have any permissions by default. You must grant them explicit
      # permission to perform specific actions. For more information, see
      # [Access Control Using AWS Identity and Access Management (IAM)][1].
      #
      # For conceptual information and underlying REST API, go to [Deleting an
      # Archive in Amazon Glacier][2] and [Delete Archive][3] in the *Amazon
      # Glacier Developer Guide*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html
      # [2]: http://docs.aws.amazon.com/amazonglacier/latest/dev/deleting-an-archive.html
      # [3]: http://docs.aws.amazon.com/amazonglacier/latest/dev/api-archive-delete.html
      # @option params [required, String] :account_id
      #   The `AccountId` value is the AWS account ID of the account that owns
      #   the vault. You can either specify an AWS account ID or optionally a
      #   single apos`-`apos (hyphen), in which case Amazon Glacier uses the AWS
      #   account ID associated with the credentials used to sign the request.
      #   If you use an account ID, do not include any hyphens (apos-apos) in
      #   the ID.
      # @option params [required, String] :vault_name
      #   The name of the vault.
      # @option params [required, String] :archive_id
      #   The ID of the archive to delete.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.delete_archive({
      #     account_id: "string", # required
      #     vault_name: "string", # required
      #     archive_id: "string", # required
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def delete_archive(params = {}, options = {})
        req = build_request(:delete_archive, params)
        req.send_request(options)
      end

      # This operation deletes a vault. Amazon Glacier will delete a vault
      # only if there are no archives in the vault as of the last inventory
      # and there have been no writes to the vault since the last inventory.
      # If either of these conditions is not satisfied, the vault deletion
      # fails (that is, the vault is not removed) and Amazon Glacier returns
      # an error. You can use DescribeVault to return the number of archives
      # in a vault, and you can use [Initiate a Job (POST jobs)][1] to
      # initiate a new inventory retrieval for a vault. The inventory contains
      # the archive IDs you use to delete archives using [Delete Archive
      # (DELETE archive)][2].
      #
      # This operation is idempotent.
      #
      # An AWS account has full permission to perform all operations
      # (actions). However, AWS Identity and Access Management (IAM) users
      # don\'t have any permissions by default. You must grant them explicit
      # permission to perform specific actions. For more information, see
      # [Access Control Using AWS Identity and Access Management (IAM)][3].
      #
      # For conceptual information and underlying REST API, go to [Deleting a
      # Vault in Amazon Glacier][4] and [Delete Vault ][5] in the *Amazon
      # Glacier Developer Guide*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/amazonglacier/latest/dev/api-initiate-job-post.html
      # [2]: http://docs.aws.amazon.com/amazonglacier/latest/dev/api-archive-delete.html
      # [3]: http://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html
      # [4]: http://docs.aws.amazon.com/amazonglacier/latest/dev/deleting-vaults.html
      # [5]: http://docs.aws.amazon.com/amazonglacier/latest/dev/api-vault-delete.html
      # @option params [required, String] :account_id
      #   The `AccountId` value is the AWS account ID of the account that owns
      #   the vault. You can either specify an AWS account ID or optionally a
      #   single apos`-`apos (hyphen), in which case Amazon Glacier uses the AWS
      #   account ID associated with the credentials used to sign the request.
      #   If you use an account ID, do not include any hyphens (apos-apos) in
      #   the ID.
      # @option params [required, String] :vault_name
      #   The name of the vault.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.delete_vault({
      #     account_id: "string", # required
      #     vault_name: "string", # required
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def delete_vault(params = {}, options = {})
        req = build_request(:delete_vault, params)
        req.send_request(options)
      end

      # This operation deletes the access policy associated with the specified
      # vault. The operation is eventually consistent; that is, it might take
      # some time for Amazon Glacier to completely remove the access policy,
      # and you might still see the effect of the policy for a short time
      # after you send the delete request.
      #
      # This operation is idempotent. You can invoke delete multiple times,
      # even if there is no policy associated with the vault. For more
      # information about vault access policies, see [Amazon Glacier Access
      # Control with Vault Access Policies][1].
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/amazonglacier/latest/dev/vault-access-policy.html
      # @option params [required, String] :account_id
      #   The `AccountId` value is the AWS account ID of the account that owns
      #   the vault. You can either specify an AWS account ID or optionally a
      #   single apos`-`apos (hyphen), in which case Amazon Glacier uses the AWS
      #   account ID associated with the credentials used to sign the request.
      #   If you use an account ID, do not include any hyphens (apos-apos) in
      #   the ID.
      # @option params [required, String] :vault_name
      #   The name of the vault.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.delete_vault_access_policy({
      #     account_id: "string", # required
      #     vault_name: "string", # required
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def delete_vault_access_policy(params = {}, options = {})
        req = build_request(:delete_vault_access_policy, params)
        req.send_request(options)
      end

      # This operation deletes the notification configuration set for a vault.
      # The operation is eventually consistent; that is, it might take some
      # time for Amazon Glacier to completely disable the notifications and
      # you might still receive some notifications for a short time after you
      # send the delete request.
      #
      # An AWS account has full permission to perform all operations
      # (actions). However, AWS Identity and Access Management (IAM) users
      # don\'t have any permissions by default. You must grant them explicit
      # permission to perform specific actions. For more information, see
      # [Access Control Using AWS Identity and Access Management (IAM)][1].
      #
      # For conceptual information and underlying REST API, go to [Configuring
      # Vault Notifications in Amazon Glacier][2] and [Delete Vault
      # Notification Configuration ][3] in the Amazon Glacier Developer Guide.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/latest/dev/using-iam-with-amazon-glacier.html
      # [2]: http://docs.aws.amazon.com/amazonglacier/latest/dev/configuring-notifications.html
      # [3]: http://docs.aws.amazon.com/amazonglacier/latest/dev/api-vault-notifications-delete.html
      # @option params [required, String] :account_id
      #   The `AccountId` value is the AWS account ID of the account that owns
      #   the vault. You can either specify an AWS account ID or optionally a
      #   single apos`-`apos (hyphen), in which case Amazon Glacier uses the AWS
      #   account ID associated with the credentials used to sign the request.
      #   If you use an account ID, do not include any hyphens (apos-apos) in
      #   the ID.
      # @option params [required, String] :vault_name
      #   The name of the vault.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.delete_vault_notifications({
      #     account_id: "string", # required
      #     vault_name: "string", # required
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def delete_vault_notifications(params = {}, options = {})
        req = build_request(:delete_vault_notifications, params)
        req.send_request(options)
      end

      # This operation returns information about a job you previously
      # initiated, including the job initiation date, the user who initiated
      # the job, the job status code/message and the Amazon SNS topic to
      # notify after Amazon Glacier completes the job. For more information
      # about initiating a job, see InitiateJob.
      #
      # <note markdown="1">This operation enables you to check the status of your job. However,
      # it is strongly recommended that you set up an Amazon SNS topic and
      # specify it in your initiate job request so that Amazon Glacier can
      # notify the topic after it completes the job.
      #
      # </note>
      #
      # A job ID will not expire for at least 24 hours after Amazon Glacier
      # completes the job.
      #
      # An AWS account has full permission to perform all operations
      # (actions). However, AWS Identity and Access Management (IAM) users
      # don\'t have any permissions by default. You must grant them explicit
      # permission to perform specific actions. For more information, see
      # [Access Control Using AWS Identity and Access Management (IAM)][1].
      #
      # For information about the underlying REST API, go to [Working with
      # Archives in Amazon Glacier][2] in the *Amazon Glacier Developer
      # Guide*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html
      # [2]: http://docs.aws.amazon.com/amazonglacier/latest/dev/api-describe-job-get.html
      # @option params [required, String] :account_id
      #   The `AccountId` value is the AWS account ID of the account that owns
      #   the vault. You can either specify an AWS account ID or optionally a
      #   single apos`-`apos (hyphen), in which case Amazon Glacier uses the AWS
      #   account ID associated with the credentials used to sign the request.
      #   If you use an account ID, do not include any hyphens (apos-apos) in
      #   the ID.
      # @option params [required, String] :vault_name
      #   The name of the vault.
      # @option params [required, String] :job_id
      #   The ID of the job to describe.
      # @return [Types::GlacierJobDescription] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::GlacierJobDescription#job_id #JobId} => String
      #   * {Types::GlacierJobDescription#job_description #JobDescription} => String
      #   * {Types::GlacierJobDescription#action #Action} => String
      #   * {Types::GlacierJobDescription#archive_id #ArchiveId} => String
      #   * {Types::GlacierJobDescription#vault_arn #VaultARN} => String
      #   * {Types::GlacierJobDescription#creation_date #CreationDate} => Time
      #   * {Types::GlacierJobDescription#completed #Completed} => Boolean
      #   * {Types::GlacierJobDescription#status_code #StatusCode} => String
      #   * {Types::GlacierJobDescription#status_message #StatusMessage} => String
      #   * {Types::GlacierJobDescription#archive_size_in_bytes #ArchiveSizeInBytes} => Integer
      #   * {Types::GlacierJobDescription#inventory_size_in_bytes #InventorySizeInBytes} => Integer
      #   * {Types::GlacierJobDescription#sns_topic #SNSTopic} => String
      #   * {Types::GlacierJobDescription#completion_date #CompletionDate} => Time
      #   * {Types::GlacierJobDescription#sha256_tree_hash #SHA256TreeHash} => String
      #   * {Types::GlacierJobDescription#archive_sha256_tree_hash #ArchiveSHA256TreeHash} => String
      #   * {Types::GlacierJobDescription#retrieval_byte_range #RetrievalByteRange} => String
      #   * {Types::GlacierJobDescription#inventory_retrieval_parameters #InventoryRetrievalParameters} => Types::InventoryRetrievalJobDescription
      #
      # @example Request syntax with placeholder values
      #   resp = client.describe_job({
      #     account_id: "string", # required
      #     vault_name: "string", # required
      #     job_id: "string", # required
      #   })
      #
      # @example Response structure
      #   resp.job_id #=> String
      #   resp.job_description #=> String
      #   resp.action #=> String, one of "ArchiveRetrieval", "InventoryRetrieval"
      #   resp.archive_id #=> String
      #   resp.vault_arn #=> String
      #   resp.creation_date #=> Time
      #   resp.completed #=> Boolean
      #   resp.status_code #=> String, one of "InProgress", "Succeeded", "Failed"
      #   resp.status_message #=> String
      #   resp.archive_size_in_bytes #=> Integer
      #   resp.inventory_size_in_bytes #=> Integer
      #   resp.sns_topic #=> String
      #   resp.completion_date #=> Time
      #   resp.sha256_tree_hash #=> String
      #   resp.archive_sha256_tree_hash #=> String
      #   resp.retrieval_byte_range #=> String
      #   resp.inventory_retrieval_parameters.format #=> String
      #   resp.inventory_retrieval_parameters.start_date #=> Time
      #   resp.inventory_retrieval_parameters.end_date #=> Time
      #   resp.inventory_retrieval_parameters.limit #=> String
      #   resp.inventory_retrieval_parameters.marker #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def describe_job(params = {}, options = {})
        req = build_request(:describe_job, params)
        req.send_request(options)
      end

      # This operation returns information about a vault, including the
      # vault\'s Amazon Resource Name (ARN), the date the vault was created,
      # the number of archives it contains, and the total size of all the
      # archives in the vault. The number of archives and their total size are
      # as of the last inventory generation. This means that if you add or
      # remove an archive from a vault, and then immediately use Describe
      # Vault, the change in contents will not be immediately reflected. If
      # you want to retrieve the latest inventory of the vault, use
      # InitiateJob. Amazon Glacier generates vault inventories approximately
      # daily. For more information, see [Downloading a Vault Inventory in
      # Amazon Glacier][1].
      #
      # An AWS account has full permission to perform all operations
      # (actions). However, AWS Identity and Access Management (IAM) users
      # don\'t have any permissions by default. You must grant them explicit
      # permission to perform specific actions. For more information, see
      # [Access Control Using AWS Identity and Access Management (IAM)][2].
      #
      # For conceptual information and underlying REST API, go to [Retrieving
      # Vault Metadata in Amazon Glacier][3] and [Describe Vault ][4] in the
      # *Amazon Glacier Developer Guide*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/amazonglacier/latest/dev/vault-inventory.html
      # [2]: http://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html
      # [3]: http://docs.aws.amazon.com/amazonglacier/latest/dev/retrieving-vault-info.html
      # [4]: http://docs.aws.amazon.com/amazonglacier/latest/dev/api-vault-get.html
      # @option params [required, String] :account_id
      #   The `AccountId` value is the AWS account ID of the account that owns
      #   the vault. You can either specify an AWS account ID or optionally a
      #   single apos`-`apos (hyphen), in which case Amazon Glacier uses the AWS
      #   account ID associated with the credentials used to sign the request.
      #   If you use an account ID, do not include any hyphens (apos-apos) in
      #   the ID.
      # @option params [required, String] :vault_name
      #   The name of the vault.
      # @return [Types::DescribeVaultOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::DescribeVaultOutput#vault_arn #VaultARN} => String
      #   * {Types::DescribeVaultOutput#vault_name #VaultName} => String
      #   * {Types::DescribeVaultOutput#creation_date #CreationDate} => Time
      #   * {Types::DescribeVaultOutput#last_inventory_date #LastInventoryDate} => Time
      #   * {Types::DescribeVaultOutput#number_of_archives #NumberOfArchives} => Integer
      #   * {Types::DescribeVaultOutput#size_in_bytes #SizeInBytes} => Integer
      #
      # @example Request syntax with placeholder values
      #   resp = client.describe_vault({
      #     account_id: "string", # required
      #     vault_name: "string", # required
      #   })
      #
      # @example Response structure
      #   resp.vault_arn #=> String
      #   resp.vault_name #=> String
      #   resp.creation_date #=> Time
      #   resp.last_inventory_date #=> Time
      #   resp.number_of_archives #=> Integer
      #   resp.size_in_bytes #=> Integer
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def describe_vault(params = {}, options = {})
        req = build_request(:describe_vault, params)
        req.send_request(options)
      end

      # This operation returns the current data retrieval policy for the
      # account and region specified in the GET request. For more information
      # about data retrieval policies, see [Amazon Glacier Data Retrieval
      # Policies][1].
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/amazonglacier/latest/dev/data-retrieval-policy.html
      # @option params [required, String] :account_id
      #   The `AccountId` value is the AWS account ID. This value must match the
      #   AWS account ID associated with the credentials used to sign the
      #   request. You can either specify an AWS account ID or optionally a
      #   single apos`-`apos (hyphen), in which case Amazon Glacier uses the AWS
      #   account ID associated with the credentials used to sign the request.
      #   If you specify your account ID, do not include any hyphens (apos-apos)
      #   in the ID.
      # @return [Types::GetDataRetrievalPolicyOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::GetDataRetrievalPolicyOutput#policy #Policy} => Types::DataRetrievalPolicy
      #
      # @example Request syntax with placeholder values
      #   resp = client.get_data_retrieval_policy({
      #     account_id: "string", # required
      #   })
      #
      # @example Response structure
      #   resp.policy.rules #=> Array
      #   resp.policy.rules[0].strategy #=> String
      #   resp.policy.rules[0].bytes_per_hour #=> Integer
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def get_data_retrieval_policy(params = {}, options = {})
        req = build_request(:get_data_retrieval_policy, params)
        req.send_request(options)
      end

      # This operation downloads the output of the job you initiated using
      # InitiateJob. Depending on the job type you specified when you
      # initiated the job, the output will be either the content of an archive
      # or a vault inventory.
      #
      # A job ID will not expire for at least 24 hours after Amazon Glacier
      # completes the job. That is, you can download the job output within the
      # 24 hours period after Amazon Glacier completes the job.
      #
      # If the job output is large, then you can use the `Range` request
      # header to retrieve a portion of the output. This allows you to
      # download the entire output in smaller chunks of bytes. For example,
      # suppose you have 1 GB of job output you want to download and you
      # decide to download 128 MB chunks of data at a time, which is a total
      # of eight Get Job Output requests. You use the following process to
      # download the job output:
      #
      # 1.  Download a 128 MB chunk of output by specifying the appropriate
      #     byte range using the `Range` header.
      #
      # 2.  Along with the data, the response includes a SHA256 tree hash of
      #     the payload. You compute the checksum of the payload on the client
      #     and compare it with the checksum you received in the response to
      #     ensure you received all the expected data.
      #
      # 3.  Repeat steps 1 and 2 for all the eight 128 MB chunks of output
      #     data, each time specifying the appropriate byte range.
      #
      # 4.  After downloading all the parts of the job output, you have a list
      #     of eight checksum values. Compute the tree hash of these values to
      #     find the checksum of the entire output. Using the DescribeJob API,
      #     obtain job information of the job that provided you the output.
      #     The response includes the checksum of the entire archive stored in
      #     Amazon Glacier. You compare this value with the checksum you
      #     computed to ensure you have downloaded the entire archive content
      #     with no errors.
      #
      # An AWS account has full permission to perform all operations
      # (actions). However, AWS Identity and Access Management (IAM) users
      # don\'t have any permissions by default. You must grant them explicit
      # permission to perform specific actions. For more information, see
      # [Access Control Using AWS Identity and Access Management (IAM)][1].
      #
      # For conceptual information and the underlying REST API, go to
      # [Downloading a Vault Inventory][2], [Downloading an Archive][3], and
      # [Get Job Output ][4]
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html
      # [2]: http://docs.aws.amazon.com/amazonglacier/latest/dev/vault-inventory.html
      # [3]: http://docs.aws.amazon.com/amazonglacier/latest/dev/downloading-an-archive.html
      # [4]: http://docs.aws.amazon.com/amazonglacier/latest/dev/api-job-output-get.html
      # @option params [required, String] :account_id
      #   The `AccountId` value is the AWS account ID of the account that owns
      #   the vault. You can either specify an AWS account ID or optionally a
      #   single apos`-`apos (hyphen), in which case Amazon Glacier uses the AWS
      #   account ID associated with the credentials used to sign the request.
      #   If you use an account ID, do not include any hyphens (apos-apos) in
      #   the ID.
      # @option params [required, String] :vault_name
      #   The name of the vault.
      # @option params [required, String] :job_id
      #   The job ID whose data is downloaded.
      # @option params [String] :range
      #   The range of bytes to retrieve from the output. For example, if you
      #   want to download the first 1,048,576 bytes, specify \"Range:
      #   bytes=0-1048575\". By default, this operation downloads the entire
      #   output.
      # @return [Types::GetJobOutputOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::GetJobOutputOutput#body #body} => IO
      #   * {Types::GetJobOutputOutput#checksum #checksum} => String
      #   * {Types::GetJobOutputOutput#status #status} => Integer
      #   * {Types::GetJobOutputOutput#content_range #contentRange} => String
      #   * {Types::GetJobOutputOutput#accept_ranges #acceptRanges} => String
      #   * {Types::GetJobOutputOutput#content_type #contentType} => String
      #   * {Types::GetJobOutputOutput#archive_description #archiveDescription} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.get_job_output({
      #     account_id: "string", # required
      #     vault_name: "string", # required
      #     job_id: "string", # required
      #     range: "string",
      #   })
      #
      # @example Response structure
      #   resp.body #=> IO
      #   resp.checksum #=> String
      #   resp.status #=> Integer
      #   resp.content_range #=> String
      #   resp.accept_ranges #=> String
      #   resp.content_type #=> String
      #   resp.archive_description #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def get_job_output(params = {}, options = {})
        req = build_request(:get_job_output, params)
        req.send_request(options)
      end

      # This operation retrieves the `access-policy` subresource set on the
      # vault; for more information on setting this subresource, see [Set
      # Vault Access Policy (PUT access-policy)][1]. If there is no access
      # policy set on the vault, the operation returns a `404 Not found`
      # error. For more information about vault access policies, see [Amazon
      # Glacier Access Control with Vault Access Policies][2].
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/amazonglacier/latest/dev/api-SetVaultAccessPolicy.html
      # [2]: http://docs.aws.amazon.com/amazonglacier/latest/dev/vault-access-policy.html
      # @option params [required, String] :account_id
      #   The `AccountId` value is the AWS account ID of the account that owns
      #   the vault. You can either specify an AWS account ID or optionally a
      #   single apos`-`apos (hyphen), in which case Amazon Glacier uses the AWS
      #   account ID associated with the credentials used to sign the request.
      #   If you use an account ID, do not include any hyphens (apos-apos) in
      #   the ID.
      # @option params [required, String] :vault_name
      #   The name of the vault.
      # @return [Types::GetVaultAccessPolicyOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::GetVaultAccessPolicyOutput#policy #policy} => Types::VaultAccessPolicy
      #
      # @example Request syntax with placeholder values
      #   resp = client.get_vault_access_policy({
      #     account_id: "string", # required
      #     vault_name: "string", # required
      #   })
      #
      # @example Response structure
      #   resp.policy.policy #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def get_vault_access_policy(params = {}, options = {})
        req = build_request(:get_vault_access_policy, params)
        req.send_request(options)
      end

      # This operation retrieves the following attributes from the
      # `lock-policy` subresource set on the specified vault: * The vault lock
      # policy set on the vault.
      #
      # * The state of the vault lock, which is either `InProgess` or
      #   `Locked`.
      #
      # * When the lock ID expires. The lock ID is used to complete the vault
      #   locking process.
      #
      # * When the vault lock was initiated and put into the `InProgress`
      #   state.
      #
      # A vault lock is put into the `InProgress` state by calling
      # InitiateVaultLock. A vault lock is put into the `Locked` state by
      # calling CompleteVaultLock. You can abort the vault locking process by
      # calling AbortVaultLock. For more information about the vault locking
      # process, [Amazon Glacier Vault Lock][1].
      #
      # If there is no vault lock policy set on the vault, the operation
      # returns a `404 Not found` error. For more information about vault lock
      # policies, [Amazon Glacier Access Control with Vault Lock Policies][2].
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/amazonglacier/latest/dev/vault-lock.html
      # [2]: http://docs.aws.amazon.com/amazonglacier/latest/dev/vault-lock-policy.html
      # @option params [required, String] :account_id
      #   The `AccountId` value is the AWS account ID of the account that owns
      #   the vault. You can either specify an AWS account ID or optionally a
      #   single apos`-`apos (hyphen), in which case Amazon Glacier uses the AWS
      #   account ID associated with the credentials used to sign the request.
      #   If you use an account ID, do not include any hyphens (apos-apos) in
      #   the ID.
      # @option params [required, String] :vault_name
      #   The name of the vault.
      # @return [Types::GetVaultLockOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::GetVaultLockOutput#policy #Policy} => String
      #   * {Types::GetVaultLockOutput#state #State} => String
      #   * {Types::GetVaultLockOutput#expiration_date #ExpirationDate} => Time
      #   * {Types::GetVaultLockOutput#creation_date #CreationDate} => Time
      #
      # @example Request syntax with placeholder values
      #   resp = client.get_vault_lock({
      #     account_id: "string", # required
      #     vault_name: "string", # required
      #   })
      #
      # @example Response structure
      #   resp.policy #=> String
      #   resp.state #=> String
      #   resp.expiration_date #=> Time
      #   resp.creation_date #=> Time
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def get_vault_lock(params = {}, options = {})
        req = build_request(:get_vault_lock, params)
        req.send_request(options)
      end

      # This operation retrieves the `notification-configuration` subresource
      # of the specified vault.
      #
      # For information about setting a notification configuration on a vault,
      # see SetVaultNotifications. If a notification configuration for a vault
      # is not set, the operation returns a `404 Not Found` error. For more
      # information about vault notifications, see [Configuring Vault
      # Notifications in Amazon Glacier][1].
      #
      # An AWS account has full permission to perform all operations
      # (actions). However, AWS Identity and Access Management (IAM) users
      # don\'t have any permissions by default. You must grant them explicit
      # permission to perform specific actions. For more information, see
      # [Access Control Using AWS Identity and Access Management (IAM)][2].
      #
      # For conceptual information and underlying REST API, go to [Configuring
      # Vault Notifications in Amazon Glacier][1] and [Get Vault Notification
      # Configuration ][3] in the *Amazon Glacier Developer Guide*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/amazonglacier/latest/dev/configuring-notifications.html
      # [2]: http://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html
      # [3]: http://docs.aws.amazon.com/amazonglacier/latest/dev/api-vault-notifications-get.html
      # @option params [required, String] :account_id
      #   The `AccountId` value is the AWS account ID of the account that owns
      #   the vault. You can either specify an AWS account ID or optionally a
      #   single apos`-`apos (hyphen), in which case Amazon Glacier uses the AWS
      #   account ID associated with the credentials used to sign the request.
      #   If you use an account ID, do not include any hyphens (apos-apos) in
      #   the ID.
      # @option params [required, String] :vault_name
      #   The name of the vault.
      # @return [Types::GetVaultNotificationsOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::GetVaultNotificationsOutput#vault_notification_config #vaultNotificationConfig} => Types::VaultNotificationConfig
      #
      # @example Request syntax with placeholder values
      #   resp = client.get_vault_notifications({
      #     account_id: "string", # required
      #     vault_name: "string", # required
      #   })
      #
      # @example Response structure
      #   resp.vault_notification_config.sns_topic #=> String
      #   resp.vault_notification_config.events #=> Array
      #   resp.vault_notification_config.events[0] #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def get_vault_notifications(params = {}, options = {})
        req = build_request(:get_vault_notifications, params)
        req.send_request(options)
      end

      # This operation initiates a job of the specified type. In this release,
      # you can initiate a job to retrieve either an archive or a vault
      # inventory (a list of archives in a vault).
      #
      # Retrieving data from Amazon Glacier is a two-step process:
      #
      # 1.  Initiate a retrieval job.
      # 
      #     <note markdown="1">A data retrieval policy can cause your initiate retrieval job
      #     request to fail with a PolicyEnforcedException exception. For more
      #     information about data retrieval policies, see [Amazon Glacier
      #     Data Retrieval Policies][1]. For more information about the
      #     PolicyEnforcedException exception, see [Error Responses][2].
      # 
      #      </note>
      #
      # 2.  After the job completes, download the bytes.
      #
      # The retrieval request is executed asynchronously. When you initiate a
      # retrieval job, Amazon Glacier creates a job and returns a job ID in
      # the response. When Amazon Glacier completes the job, you can get the
      # job output (archive or inventory data). For information about getting
      # job output, see GetJobOutput operation.
      #
      # The job must complete before you can get its output. To determine when
      # a job is complete, you have the following options:
      #
      # * **Use Amazon SNS Notification** You can specify an Amazon Simple
      #   Notification Service (Amazon SNS) topic to which Amazon Glacier can
      #   post a notification after the job is completed. You can specify an
      #   SNS topic per job request. The notification is sent only after
      #   Amazon Glacier completes the job. In addition to specifying an SNS
      #   topic per job request, you can configure vault notifications for a
      #   vault so that job notifications are always sent. For more
      #   information, see SetVaultNotifications.
      #
      # * **Get job details** You can make a DescribeJob request to obtain job
      #   status information while a job is in progress. However, it is more
      #   efficient to use an Amazon SNS notification to determine when a job
      #   is complete.
      #
      # <note markdown="1">The information you get via notification is same that you get by
      # calling DescribeJob.
      #
      # </note>
      #
      # If for a specific event, you add both the notification configuration
      # on the vault and also specify an SNS topic in your initiate job
      # request, Amazon Glacier sends both notifications. For more
      # information, see SetVaultNotifications.
      #
      # An AWS account has full permission to perform all operations
      # (actions). However, AWS Identity and Access Management (IAM) users
      # don\'t have any permissions by default. You must grant them explicit
      # permission to perform specific actions. For more information, see
      # [Access Control Using AWS Identity and Access Management (IAM)][3].
      #
      # **About the Vault Inventory**
      #
      # Amazon Glacier prepares an inventory for each vault periodically,
      # every 24 hours. When you initiate a job for a vault inventory, Amazon
      # Glacier returns the last inventory for the vault. The inventory data
      # you get might be up to a day or two days old. Also, the initiate
      # inventory job might take some time to complete before you can download
      # the vault inventory. So you do not want to retrieve a vault inventory
      # for each vault operation. However, in some scenarios, you might find
      # the vault inventory useful. For example, when you upload an archive,
      # you can provide an archive description but not an archive name. Amazon
      # Glacier provides you a unique archive ID, an opaque string of
      # characters. So, you might maintain your own database that maps archive
      # names to their corresponding Amazon Glacier assigned archive IDs. You
      # might find the vault inventory useful in the event you need to
      # reconcile information in your database with the actual vault
      # inventory.
      #
      # **Range Inventory Retrieval**
      #
      # You can limit the number of inventory items retrieved by filtering on
      # the archive creation date or by setting a limit.
      #
      # *Filtering by Archive Creation Date*
      #
      # You can retrieve inventory items for archives created between
      # `StartDate` and `EndDate` by specifying values for these parameters in
      # the **InitiateJob** request. Archives created on or after the
      # `StartDate` and before the `EndDate` will be returned. If you only
      # provide the `StartDate` without the `EndDate`, you will retrieve the
      # inventory for all archives created on or after the `StartDate`. If you
      # only provide the `EndDate` without the `StartDate`, you will get back
      # the inventory for all archives created before the `EndDate`.
      #
      # *Limiting Inventory Items per Retrieval*
      #
      # You can limit the number of inventory items returned by setting the
      # `Limit` parameter in the **InitiateJob** request. The inventory job
      # output will contain inventory items up to the specified `Limit`. If
      # there are more inventory items available, the result is paginated.
      # After a job is complete you can use the DescribeJob operation to get a
      # marker that you use in a subsequent **InitiateJob** request. The
      # marker will indicate the starting point to retrieve the next set of
      # inventory items. You can page through your entire inventory by
      # repeatedly making **InitiateJob** requests with the marker from the
      # previous **DescribeJob** output, until you get a marker from
      # **DescribeJob** that returns null, indicating that there are no more
      # inventory items available.
      #
      # You can use the `Limit` parameter together with the date range
      # parameters.
      #
      # **About Ranged Archive Retrieval**
      #
      # You can initiate an archive retrieval for the whole archive or a range
      # of the archive. In the case of ranged archive retrieval, you specify a
      # byte range to return or the whole archive. The range specified must be
      # megabyte (MB) aligned, that is the range start value must be divisible
      # by 1 MB and range end value plus 1 must be divisible by 1 MB or equal
      # the end of the archive. If the ranged archive retrieval is not
      # megabyte aligned, this operation returns a 400 response. Furthermore,
      # to ensure you get checksum values for data you download using Get Job
      # Output API, the range must be tree hash aligned.
      #
      # An AWS account has full permission to perform all operations
      # (actions). However, AWS Identity and Access Management (IAM) users
      # don\'t have any permissions by default. You must grant them explicit
      # permission to perform specific actions. For more information, see
      # [Access Control Using AWS Identity and Access Management (IAM)][3].
      #
      # For conceptual information and the underlying REST API, go to
      # [Initiate a Job][4] and [Downloading a Vault Inventory][5]
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/amazonglacier/latest/dev/data-retrieval-policy.html
      # [2]: http://docs.aws.amazon.com/amazonglacier/latest/dev/api-error-responses.html
      # [3]: http://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html
      # [4]: http://docs.aws.amazon.com/amazonglacier/latest/dev/api-initiate-job-post.html
      # [5]: http://docs.aws.amazon.com/amazonglacier/latest/dev/vault-inventory.html
      # @option params [required, String] :account_id
      #   The `AccountId` value is the AWS account ID of the account that owns
      #   the vault. You can either specify an AWS account ID or optionally a
      #   single apos`-`apos (hyphen), in which case Amazon Glacier uses the AWS
      #   account ID associated with the credentials used to sign the request.
      #   If you use an account ID, do not include any hyphens (apos-apos) in
      #   the ID.
      # @option params [required, String] :vault_name
      #   The name of the vault.
      # @option params [Types::JobParameters] :job_parameters
      #   Provides options for specifying job information.
      # @return [Types::InitiateJobOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::InitiateJobOutput#location #location} => String
      #   * {Types::InitiateJobOutput#job_id #jobId} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.initiate_job({
      #     account_id: "string", # required
      #     vault_name: "string", # required
      #     job_parameters: {
      #       format: "string",
      #       type: "string",
      #       archive_id: "string",
      #       description: "string",
      #       sns_topic: "string",
      #       retrieval_byte_range: "string",
      #       inventory_retrieval_parameters: {
      #         start_date: Time.now,
      #         end_date: Time.now,
      #         limit: "string",
      #         marker: "string",
      #       },
      #     },
      #   })
      #
      # @example Response structure
      #   resp.location #=> String
      #   resp.job_id #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def initiate_job(params = {}, options = {})
        req = build_request(:initiate_job, params)
        req.send_request(options)
      end

      # This operation initiates a multipart upload. Amazon Glacier creates a
      # multipart upload resource and returns its ID in the response. The
      # multipart upload ID is used in subsequent requests to upload parts of
      # an archive (see UploadMultipartPart).
      #
      # When you initiate a multipart upload, you specify the part size in
      # number of bytes. The part size must be a megabyte (1024 KB) multiplied
      # by a power of 2-for example, 1048576 (1 MB), 2097152 (2 MB), 4194304
      # (4 MB), 8388608 (8 MB), and so on. The minimum allowable part size is
      # 1 MB, and the maximum is 4 GB.
      #
      # Every part you upload to this resource (see UploadMultipartPart),
      # except the last one, must have the same size. The last one can be the
      # same size or smaller. For example, suppose you want to upload a 16.2
      # MB file. If you initiate the multipart upload with a part size of 4
      # MB, you will upload four parts of 4 MB each and one part of 0.2 MB.
      #
      # <note markdown="1">You don\'t need to know the size of the archive when you start a
      # multipart upload because Amazon Glacier does not require you to
      # specify the overall archive size.
      #
      # </note>
      #
      # After you complete the multipart upload, Amazon Glacier removes the
      # multipart upload resource referenced by the ID. Amazon Glacier also
      # removes the multipart upload resource if you cancel the multipart
      # upload or it may be removed if there is no activity for a period of 24
      # hours.
      #
      # An AWS account has full permission to perform all operations
      # (actions). However, AWS Identity and Access Management (IAM) users
      # don\'t have any permissions by default. You must grant them explicit
      # permission to perform specific actions. For more information, see
      # [Access Control Using AWS Identity and Access Management (IAM)][1].
      #
      # For conceptual information and underlying REST API, go to [Uploading
      # Large Archives in Parts (Multipart Upload)][2] and [Initiate Multipart
      # Upload][3] in the *Amazon Glacier Developer Guide*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html
      # [2]: http://docs.aws.amazon.com/amazonglacier/latest/dev/uploading-archive-mpu.html
      # [3]: http://docs.aws.amazon.com/amazonglacier/latest/dev/api-multipart-initiate-upload.html
      # @option params [required, String] :account_id
      #   The `AccountId` value is the AWS account ID of the account that owns
      #   the vault. You can either specify an AWS account ID or optionally a
      #   single apos`-`apos (hyphen), in which case Amazon Glacier uses the AWS
      #   account ID associated with the credentials used to sign the request.
      #   If you use an account ID, do not include any hyphens (apos-apos) in
      #   the ID.
      # @option params [required, String] :vault_name
      #   The name of the vault.
      # @option params [String] :archive_description
      #   The archive description that you are uploading in parts.
      #
      #   The part size must be a megabyte (1024 KB) multiplied by a power of 2,
      #   for example 1048576 (1 MB), 2097152 (2 MB), 4194304 (4 MB), 8388608 (8
      #   MB), and so on. The minimum allowable part size is 1 MB, and the
      #   maximum is 4 GB (4096 MB).
      # @option params [Integer] :part_size
      #   The size of each part except the last, in bytes. The last part can be
      #   smaller than this part size.
      # @return [Types::InitiateMultipartUploadOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::InitiateMultipartUploadOutput#location #location} => String
      #   * {Types::InitiateMultipartUploadOutput#upload_id #uploadId} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.initiate_multipart_upload({
      #     account_id: "string", # required
      #     vault_name: "string", # required
      #     archive_description: "string",
      #     part_size: 1,
      #   })
      #
      # @example Response structure
      #   resp.location #=> String
      #   resp.upload_id #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def initiate_multipart_upload(params = {}, options = {})
        req = build_request(:initiate_multipart_upload, params)
        req.send_request(options)
      end

      # This operation initiates the vault locking process by doing the
      # following: * Installing a vault lock policy on the specified vault.
      #
      # * Setting the lock state of vault lock to `InProgress`.
      #
      # * Returning a lock ID, which is used to complete the vault locking
      #   process.
      #
      # You can set one vault lock policy for each vault and this policy can
      # be up to 20 KB in size. For more information about vault lock
      # policies, see [Amazon Glacier Access Control with Vault Lock
      # Policies][1].
      #
      # You must complete the vault locking process within 24 hours after the
      # vault lock enters the `InProgress` state. After the 24 hour window
      # ends, the lock ID expires, the vault automatically exits the
      # `InProgress` state, and the vault lock policy is removed from the
      # vault. You call CompleteVaultLock to complete the vault locking
      # process by setting the state of the vault lock to `Locked`.
      #
      # After a vault lock is in the `Locked` state, you cannot initiate a new
      # vault lock for the vault.
      #
      # You can abort the vault locking process by calling AbortVaultLock. You
      # can get the state of the vault lock by calling GetVaultLock. For more
      # information about the vault locking process, [Amazon Glacier Vault
      # Lock][2].
      #
      # If this operation is called when the vault lock is in the `InProgress`
      # state, the operation returns an `AccessDeniedException` error. When
      # the vault lock is in the `InProgress` state you must call
      # AbortVaultLock before you can initiate a new vault lock policy.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/amazonglacier/latest/dev/vault-lock-policy.html
      # [2]: http://docs.aws.amazon.com/amazonglacier/latest/dev/vault-lock.html
      # @option params [required, String] :account_id
      #   The `AccountId` value is the AWS account ID. This value must match the
      #   AWS account ID associated with the credentials used to sign the
      #   request. You can either specify an AWS account ID or optionally a
      #   single apos`-`apos (hyphen), in which case Amazon Glacier uses the AWS
      #   account ID associated with the credentials used to sign the request.
      #   If you specify your account ID, do not include any hyphens (apos-apos)
      #   in the ID.
      # @option params [required, String] :vault_name
      #   The name of the vault.
      # @option params [Types::VaultLockPolicy] :policy
      #   The vault lock policy as a JSON string, which uses \"\\\" as an escape
      #   character.
      # @return [Types::InitiateVaultLockOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::InitiateVaultLockOutput#lock_id #lockId} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.initiate_vault_lock({
      #     account_id: "string", # required
      #     vault_name: "string", # required
      #     policy: {
      #       policy: "string",
      #     },
      #   })
      #
      # @example Response structure
      #   resp.lock_id #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def initiate_vault_lock(params = {}, options = {})
        req = build_request(:initiate_vault_lock, params)
        req.send_request(options)
      end

      # This operation lists jobs for a vault, including jobs that are
      # in-progress and jobs that have recently finished.
      #
      # <note markdown="1">Amazon Glacier retains recently completed jobs for a period before
      # deleting them; however, it eventually removes completed jobs. The
      # output of completed jobs can be retrieved. Retaining completed jobs
      # for a period of time after they have completed enables you to get a
      # job output in the event you miss the job completion notification or
      # your first attempt to download it fails. For example, suppose you
      # start an archive retrieval job to download an archive. After the job
      # completes, you start to download the archive but encounter a network
      # error. In this scenario, you can retry and download the archive while
      # the job exists.
      #
      # </note>
      #
      # To retrieve an archive or retrieve a vault inventory from Amazon
      # Glacier, you first initiate a job, and after the job completes, you
      # download the data. For an archive retrieval, the output is the archive
      # data, and for an inventory retrieval, it is the inventory list. The
      # List Job operation returns a list of these jobs sorted by job
      # initiation time.
      #
      # This List Jobs operation supports pagination. By default, this
      # operation returns up to 1,000 jobs in the response. You should always
      # check the response for a `marker` at which to continue the list; if
      # there are no more items the `marker` is `null`. To return a list of
      # jobs that begins at a specific job, set the `marker` request parameter
      # to the value you obtained from a previous List Jobs request. You can
      # also limit the number of jobs returned in the response by specifying
      # the `limit` parameter in the request.
      #
      # Additionally, you can filter the jobs list returned by specifying an
      # optional `statuscode` (InProgress, Succeeded, or Failed) and
      # `completed` (true, false) parameter. The `statuscode` allows you to
      # specify that only jobs that match a specified status are returned. The
      # `completed` parameter allows you to specify that only jobs in a
      # specific completion state are returned.
      #
      # An AWS account has full permission to perform all operations
      # (actions). However, AWS Identity and Access Management (IAM) users
      # don\'t have any permissions by default. You must grant them explicit
      # permission to perform specific actions. For more information, see
      # [Access Control Using AWS Identity and Access Management (IAM)][1].
      #
      # For the underlying REST API, go to [List Jobs ][2]
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html
      # [2]: http://docs.aws.amazon.com/amazonglacier/latest/dev/api-jobs-get.html
      # @option params [required, String] :account_id
      #   The `AccountId` value is the AWS account ID of the account that owns
      #   the vault. You can either specify an AWS account ID or optionally a
      #   single apos`-`apos (hyphen), in which case Amazon Glacier uses the AWS
      #   account ID associated with the credentials used to sign the request.
      #   If you use an account ID, do not include any hyphens (apos-apos) in
      #   the ID.
      # @option params [required, String] :vault_name
      #   The name of the vault.
      # @option params [Integer] :limit
      #   Specifies that the response be limited to the specified number of
      #   items or fewer. If not specified, the List Jobs operation returns up
      #   to 1,000 jobs.
      # @option params [String] :marker
      #   An opaque string used for pagination. This value specifies the job at
      #   which the listing of jobs should begin. Get the marker value from a
      #   previous List Jobs response. You need only include the marker if you
      #   are continuing the pagination of results started in a previous List
      #   Jobs request.
      # @option params [String] :statuscode
      #   Specifies the type of job status to return. You can specify the
      #   following values: \"InProgress\", \"Succeeded\", or \"Failed\".
      # @option params [String] :completed
      #   Specifies the state of the jobs to return. You can specify `true` or
      #   `false`.
      # @return [Types::ListJobsOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::ListJobsOutput#job_list #JobList} => Array&lt;Types::GlacierJobDescription&gt;
      #   * {Types::ListJobsOutput#marker #Marker} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.list_jobs({
      #     account_id: "string", # required
      #     vault_name: "string", # required
      #     limit: 1,
      #     marker: "string",
      #     statuscode: "string",
      #     completed: "string",
      #   })
      #
      # @example Response structure
      #   resp.job_list #=> Array
      #   resp.job_list[0].job_id #=> String
      #   resp.job_list[0].job_description #=> String
      #   resp.job_list[0].action #=> String, one of "ArchiveRetrieval", "InventoryRetrieval"
      #   resp.job_list[0].archive_id #=> String
      #   resp.job_list[0].vault_arn #=> String
      #   resp.job_list[0].creation_date #=> Time
      #   resp.job_list[0].completed #=> Boolean
      #   resp.job_list[0].status_code #=> String, one of "InProgress", "Succeeded", "Failed"
      #   resp.job_list[0].status_message #=> String
      #   resp.job_list[0].archive_size_in_bytes #=> Integer
      #   resp.job_list[0].inventory_size_in_bytes #=> Integer
      #   resp.job_list[0].sns_topic #=> String
      #   resp.job_list[0].completion_date #=> Time
      #   resp.job_list[0].sha256_tree_hash #=> String
      #   resp.job_list[0].archive_sha256_tree_hash #=> String
      #   resp.job_list[0].retrieval_byte_range #=> String
      #   resp.job_list[0].inventory_retrieval_parameters.format #=> String
      #   resp.job_list[0].inventory_retrieval_parameters.start_date #=> Time
      #   resp.job_list[0].inventory_retrieval_parameters.end_date #=> Time
      #   resp.job_list[0].inventory_retrieval_parameters.limit #=> String
      #   resp.job_list[0].inventory_retrieval_parameters.marker #=> String
      #   resp.marker #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def list_jobs(params = {}, options = {})
        req = build_request(:list_jobs, params)
        req.send_request(options)
      end

      # This operation lists in-progress multipart uploads for the specified
      # vault. An in-progress multipart upload is a multipart upload that has
      # been initiated by an InitiateMultipartUpload request, but has not yet
      # been completed or aborted. The list returned in the List Multipart
      # Upload response has no guaranteed order.
      #
      # The List Multipart Uploads operation supports pagination. By default,
      # this operation returns up to 1,000 multipart uploads in the response.
      # You should always check the response for a `marker` at which to
      # continue the list; if there are no more items the `marker` is `null`.
      # To return a list of multipart uploads that begins at a specific
      # upload, set the `marker` request parameter to the value you obtained
      # from a previous List Multipart Upload request. You can also limit the
      # number of uploads returned in the response by specifying the `limit`
      # parameter in the request.
      #
      # Note the difference between this operation and listing parts
      # (ListParts). The List Multipart Uploads operation lists all multipart
      # uploads for a vault and does not require a multipart upload ID. The
      # List Parts operation requires a multipart upload ID since parts are
      # associated with a single upload.
      #
      # An AWS account has full permission to perform all operations
      # (actions). However, AWS Identity and Access Management (IAM) users
      # don\'t have any permissions by default. You must grant them explicit
      # permission to perform specific actions. For more information, see
      # [Access Control Using AWS Identity and Access Management (IAM)][1].
      #
      # For conceptual information and the underlying REST API, go to [Working
      # with Archives in Amazon Glacier][2] and [List Multipart Uploads ][3]
      # in the *Amazon Glacier Developer Guide*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html
      # [2]: http://docs.aws.amazon.com/amazonglacier/latest/dev/working-with-archives.html
      # [3]: http://docs.aws.amazon.com/amazonglacier/latest/dev/api-multipart-list-uploads.html
      # @option params [required, String] :account_id
      #   The `AccountId` value is the AWS account ID of the account that owns
      #   the vault. You can either specify an AWS account ID or optionally a
      #   single apos`-`apos (hyphen), in which case Amazon Glacier uses the AWS
      #   account ID associated with the credentials used to sign the request.
      #   If you use an account ID, do not include any hyphens (apos-apos) in
      #   the ID.
      # @option params [required, String] :vault_name
      #   The name of the vault.
      # @option params [String] :marker
      #   An opaque string used for pagination. This value specifies the upload
      #   at which the listing of uploads should begin. Get the marker value
      #   from a previous List Uploads response. You need only include the
      #   marker if you are continuing the pagination of results started in a
      #   previous List Uploads request.
      # @option params [Integer] :limit
      #   Specifies the maximum number of uploads returned in the response body.
      #   If this value is not specified, the List Uploads operation returns up
      #   to 1,000 uploads.
      # @return [Types::ListMultipartUploadsOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::ListMultipartUploadsOutput#uploads_list #UploadsList} => Array&lt;Types::UploadListElement&gt;
      #   * {Types::ListMultipartUploadsOutput#marker #Marker} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.list_multipart_uploads({
      #     account_id: "string", # required
      #     vault_name: "string", # required
      #     marker: "string",
      #     limit: 1,
      #   })
      #
      # @example Response structure
      #   resp.uploads_list #=> Array
      #   resp.uploads_list[0].multipart_upload_id #=> String
      #   resp.uploads_list[0].vault_arn #=> String
      #   resp.uploads_list[0].archive_description #=> String
      #   resp.uploads_list[0].part_size_in_bytes #=> Integer
      #   resp.uploads_list[0].creation_date #=> Time
      #   resp.marker #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def list_multipart_uploads(params = {}, options = {})
        req = build_request(:list_multipart_uploads, params)
        req.send_request(options)
      end

      # This operation lists the parts of an archive that have been uploaded
      # in a specific multipart upload. You can make this request at any time
      # during an in-progress multipart upload before you complete the upload
      # (see CompleteMultipartUpload. List Parts returns an error for
      # completed uploads. The list returned in the List Parts response is
      # sorted by part range.
      #
      # The List Parts operation supports pagination. By default, this
      # operation returns up to 1,000 uploaded parts in the response. You
      # should always check the response for a `marker` at which to continue
      # the list; if there are no more items the `marker` is `null`. To return
      # a list of parts that begins at a specific part, set the `marker`
      # request parameter to the value you obtained from a previous List Parts
      # request. You can also limit the number of parts returned in the
      # response by specifying the `limit` parameter in the request.
      #
      # An AWS account has full permission to perform all operations
      # (actions). However, AWS Identity and Access Management (IAM) users
      # don\'t have any permissions by default. You must grant them explicit
      # permission to perform specific actions. For more information, see
      # [Access Control Using AWS Identity and Access Management (IAM)][1].
      #
      # For conceptual information and the underlying REST API, go to [Working
      # with Archives in Amazon Glacier][2] and [List Parts][3] in the *Amazon
      # Glacier Developer Guide*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html
      # [2]: http://docs.aws.amazon.com/amazonglacier/latest/dev/working-with-archives.html
      # [3]: http://docs.aws.amazon.com/amazonglacier/latest/dev/api-multipart-list-parts.html
      # @option params [required, String] :account_id
      #   The `AccountId` value is the AWS account ID of the account that owns
      #   the vault. You can either specify an AWS account ID or optionally a
      #   single apos`-`apos (hyphen), in which case Amazon Glacier uses the AWS
      #   account ID associated with the credentials used to sign the request.
      #   If you use an account ID, do not include any hyphens (apos-apos) in
      #   the ID.
      # @option params [required, String] :vault_name
      #   The name of the vault.
      # @option params [required, String] :upload_id
      #   The upload ID of the multipart upload.
      # @option params [String] :marker
      #   An opaque string used for pagination. This value specifies the part at
      #   which the listing of parts should begin. Get the marker value from the
      #   response of a previous List Parts response. You need only include the
      #   marker if you are continuing the pagination of results started in a
      #   previous List Parts request.
      # @option params [Integer] :limit
      #   Specifies the maximum number of parts returned in the response body.
      #   If this value is not specified, the List Parts operation returns up to
      #   1,000 uploads.
      # @return [Types::ListPartsOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::ListPartsOutput#multipart_upload_id #MultipartUploadId} => String
      #   * {Types::ListPartsOutput#vault_arn #VaultARN} => String
      #   * {Types::ListPartsOutput#archive_description #ArchiveDescription} => String
      #   * {Types::ListPartsOutput#part_size_in_bytes #PartSizeInBytes} => Integer
      #   * {Types::ListPartsOutput#creation_date #CreationDate} => Time
      #   * {Types::ListPartsOutput#parts #Parts} => Array&lt;Types::PartListElement&gt;
      #   * {Types::ListPartsOutput#marker #Marker} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.list_parts({
      #     account_id: "string", # required
      #     vault_name: "string", # required
      #     upload_id: "string", # required
      #     marker: "string",
      #     limit: 1,
      #   })
      #
      # @example Response structure
      #   resp.multipart_upload_id #=> String
      #   resp.vault_arn #=> String
      #   resp.archive_description #=> String
      #   resp.part_size_in_bytes #=> Integer
      #   resp.creation_date #=> Time
      #   resp.parts #=> Array
      #   resp.parts[0].range_in_bytes #=> String
      #   resp.parts[0].sha256_tree_hash #=> String
      #   resp.marker #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def list_parts(params = {}, options = {})
        req = build_request(:list_parts, params)
        req.send_request(options)
      end

      # This operation lists all the tags attached to a vault. The operation
      # returns an empty map if there are no tags. For more information about
      # tags, see [Tagging Amazon Glacier Resources][1].
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/amazonglacier/latest/dev/tagging.html
      # @option params [required, String] :account_id
      #   The `AccountId` value is the AWS account ID of the account that owns
      #   the vault. You can either specify an AWS account ID or optionally a
      #   single apos`-`apos (hyphen), in which case Amazon Glacier uses the AWS
      #   account ID associated with the credentials used to sign the request.
      #   If you use an account ID, do not include any hyphens (apos-apos) in
      #   the ID.
      # @option params [required, String] :vault_name
      #   The name of the vault.
      # @return [Types::ListTagsForVaultOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::ListTagsForVaultOutput#tags #Tags} => Hash&lt;String,String&gt;
      #
      # @example Request syntax with placeholder values
      #   resp = client.list_tags_for_vault({
      #     account_id: "string", # required
      #     vault_name: "string", # required
      #   })
      #
      # @example Response structure
      #   resp.tags #=> Hash
      #   resp.tags["TagKey"] #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def list_tags_for_vault(params = {}, options = {})
        req = build_request(:list_tags_for_vault, params)
        req.send_request(options)
      end

      # This operation lists all vaults owned by the calling user\'s account.
      # The list returned in the response is ASCII-sorted by vault name.
      #
      # By default, this operation returns up to 1,000 items. If there are
      # more vaults to list, the response `marker` field contains the vault
      # Amazon Resource Name (ARN) at which to continue the list with a new
      # List Vaults request; otherwise, the `marker` field is `null`. To
      # return a list of vaults that begins at a specific vault, set the
      # `marker` request parameter to the vault ARN you obtained from a
      # previous List Vaults request. You can also limit the number of vaults
      # returned in the response by specifying the `limit` parameter in the
      # request.
      #
      # An AWS account has full permission to perform all operations
      # (actions). However, AWS Identity and Access Management (IAM) users
      # don\'t have any permissions by default. You must grant them explicit
      # permission to perform specific actions. For more information, see
      # [Access Control Using AWS Identity and Access Management (IAM)][1].
      #
      # For conceptual information and underlying REST API, go to [Retrieving
      # Vault Metadata in Amazon Glacier][2] and [List Vaults ][3] in the
      # *Amazon Glacier Developer Guide*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html
      # [2]: http://docs.aws.amazon.com/amazonglacier/latest/dev/retrieving-vault-info.html
      # [3]: http://docs.aws.amazon.com/amazonglacier/latest/dev/api-vaults-get.html
      # @option params [required, String] :account_id
      #   The `AccountId` value is the AWS account ID. This value must match the
      #   AWS account ID associated with the credentials used to sign the
      #   request. You can either specify an AWS account ID or optionally a
      #   single apos`-`apos (hyphen), in which case Amazon Glacier uses the AWS
      #   account ID associated with the credentials used to sign the request.
      #   If you specify your account ID, do not include any hyphens (apos-apos)
      #   in the ID.
      # @option params [String] :marker
      #   A string used for pagination. The marker specifies the vault ARN after
      #   which the listing of vaults should begin.
      # @option params [Integer] :limit
      #   The maximum number of items returned in the response. If you don\'t
      #   specify a value, the List Vaults operation returns up to 1,000 items.
      # @return [Types::ListVaultsOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::ListVaultsOutput#vault_list #VaultList} => Array&lt;Types::DescribeVaultOutput&gt;
      #   * {Types::ListVaultsOutput#marker #Marker} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.list_vaults({
      #     account_id: "string", # required
      #     marker: "string",
      #     limit: 1,
      #   })
      #
      # @example Response structure
      #   resp.vault_list #=> Array
      #   resp.vault_list[0].vault_arn #=> String
      #   resp.vault_list[0].vault_name #=> String
      #   resp.vault_list[0].creation_date #=> Time
      #   resp.vault_list[0].last_inventory_date #=> Time
      #   resp.vault_list[0].number_of_archives #=> Integer
      #   resp.vault_list[0].size_in_bytes #=> Integer
      #   resp.marker #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def list_vaults(params = {}, options = {})
        req = build_request(:list_vaults, params)
        req.send_request(options)
      end

      # This operation removes one or more tags from the set of tags attached
      # to a vault. For more information about tags, see [Tagging Amazon
      # Glacier Resources][1]. This operation is idempotent. The operation
      # will be successful, even if there are no tags attached to the vault.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/amazonglacier/latest/dev/tagging.html
      # @option params [required, String] :account_id
      #   The `AccountId` value is the AWS account ID of the account that owns
      #   the vault. You can either specify an AWS account ID or optionally a
      #   single apos`-`apos (hyphen), in which case Amazon Glacier uses the AWS
      #   account ID associated with the credentials used to sign the request.
      #   If you use an account ID, do not include any hyphens (apos-apos) in
      #   the ID.
      # @option params [required, String] :vault_name
      #   The name of the vault.
      # @option params [Array<String>] :tag_keys
      #   A list of tag keys. Each corresponding tag is removed from the vault.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.remove_tags_from_vault({
      #     account_id: "string", # required
      #     vault_name: "string", # required
      #     tag_keys: ["string"],
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def remove_tags_from_vault(params = {}, options = {})
        req = build_request(:remove_tags_from_vault, params)
        req.send_request(options)
      end

      # This operation sets and then enacts a data retrieval policy in the
      # region specified in the PUT request. You can set one policy per region
      # for an AWS account. The policy is enacted within a few minutes of a
      # successful PUT operation.
      #
      # The set policy operation does not affect retrieval jobs that were in
      # progress before the policy was enacted. For more information about
      # data retrieval policies, see [Amazon Glacier Data Retrieval
      # Policies][1].
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/amazonglacier/latest/dev/data-retrieval-policy.html
      # @option params [required, String] :account_id
      #   The `AccountId` value is the AWS account ID. This value must match the
      #   AWS account ID associated with the credentials used to sign the
      #   request. You can either specify an AWS account ID or optionally a
      #   single apos`-`apos (hyphen), in which case Amazon Glacier uses the AWS
      #   account ID associated with the credentials used to sign the request.
      #   If you specify your account ID, do not include any hyphens (apos-apos)
      #   in the ID.
      # @option params [Types::DataRetrievalPolicy] :policy
      #   The data retrieval policy in JSON format.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.set_data_retrieval_policy({
      #     account_id: "string", # required
      #     policy: {
      #       rules: [
      #         {
      #           strategy: "string",
      #           bytes_per_hour: 1,
      #         },
      #       ],
      #     },
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def set_data_retrieval_policy(params = {}, options = {})
        req = build_request(:set_data_retrieval_policy, params)
        req.send_request(options)
      end

      # This operation configures an access policy for a vault and will
      # overwrite an existing policy. To configure a vault access policy, send
      # a PUT request to the `access-policy` subresource of the vault. An
      # access policy is specific to a vault and is also called a vault
      # subresource. You can set one access policy per vault and the policy
      # can be up to 20 KB in size. For more information about vault access
      # policies, see [Amazon Glacier Access Control with Vault Access
      # Policies][1].
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/amazonglacier/latest/dev/vault-access-policy.html
      # @option params [required, String] :account_id
      #   The `AccountId` value is the AWS account ID of the account that owns
      #   the vault. You can either specify an AWS account ID or optionally a
      #   single apos`-`apos (hyphen), in which case Amazon Glacier uses the AWS
      #   account ID associated with the credentials used to sign the request.
      #   If you use an account ID, do not include any hyphens (apos-apos) in
      #   the ID.
      # @option params [required, String] :vault_name
      #   The name of the vault.
      # @option params [Types::VaultAccessPolicy] :policy
      #   The vault access policy as a JSON string.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.set_vault_access_policy({
      #     account_id: "string", # required
      #     vault_name: "string", # required
      #     policy: {
      #       policy: "string",
      #     },
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def set_vault_access_policy(params = {}, options = {})
        req = build_request(:set_vault_access_policy, params)
        req.send_request(options)
      end

      # This operation configures notifications that will be sent when
      # specific events happen to a vault. By default, you don\'t get any
      # notifications.
      #
      # To configure vault notifications, send a PUT request to the
      # `notification-configuration` subresource of the vault. The request
      # should include a JSON document that provides an Amazon SNS topic and
      # specific events for which you want Amazon Glacier to send
      # notifications to the topic.
      #
      # Amazon SNS topics must grant permission to the vault to be allowed to
      # publish notifications to the topic. You can configure a vault to
      # publish a notification for the following vault events:
      #
      # * **ArchiveRetrievalCompleted** This event occurs when a job that was
      #   initiated for an archive retrieval is completed (InitiateJob). The
      #   status of the completed job can be \"Succeeded\" or \"Failed\". The
      #   notification sent to the SNS topic is the same output as returned
      #   from DescribeJob.
      # * **InventoryRetrievalCompleted** This event occurs when a job that
      #   was initiated for an inventory retrieval is completed (InitiateJob).
      #   The status of the completed job can be \"Succeeded\" or \"Failed\".
      #   The notification sent to the SNS topic is the same output as
      #   returned from DescribeJob.
      #
      # An AWS account has full permission to perform all operations
      # (actions). However, AWS Identity and Access Management (IAM) users
      # don\'t have any permissions by default. You must grant them explicit
      # permission to perform specific actions. For more information, see
      # [Access Control Using AWS Identity and Access Management (IAM)][1].
      #
      # For conceptual information and underlying REST API, go to [Configuring
      # Vault Notifications in Amazon Glacier][2] and [Set Vault Notification
      # Configuration ][3] in the *Amazon Glacier Developer Guide*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html
      # [2]: http://docs.aws.amazon.com/amazonglacier/latest/dev/configuring-notifications.html
      # [3]: http://docs.aws.amazon.com/amazonglacier/latest/dev/api-vault-notifications-put.html
      # @option params [required, String] :account_id
      #   The `AccountId` value is the AWS account ID of the account that owns
      #   the vault. You can either specify an AWS account ID or optionally a
      #   single apos`-`apos (hyphen), in which case Amazon Glacier uses the AWS
      #   account ID associated with the credentials used to sign the request.
      #   If you use an account ID, do not include any hyphens (apos-apos) in
      #   the ID.
      # @option params [required, String] :vault_name
      #   The name of the vault.
      # @option params [Types::VaultNotificationConfig] :vault_notification_config
      #   Provides options for specifying notification configuration.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.set_vault_notifications({
      #     account_id: "string", # required
      #     vault_name: "string", # required
      #     vault_notification_config: {
      #       sns_topic: "string",
      #       events: ["string"],
      #     },
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def set_vault_notifications(params = {}, options = {})
        req = build_request(:set_vault_notifications, params)
        req.send_request(options)
      end

      # This operation adds an archive to a vault. This is a synchronous
      # operation, and for a successful upload, your data is durably
      # persisted. Amazon Glacier returns the archive ID in the
      # `x-amz-archive-id` header of the response.
      #
      # You must use the archive ID to access your data in Amazon Glacier.
      # After you upload an archive, you should save the archive ID returned
      # so that you can retrieve or delete the archive later. Besides saving
      # the archive ID, you can also index it and give it a friendly name to
      # allow for better searching. You can also use the optional archive
      # description field to specify how the archive is referred to in an
      # external index of archives, such as you might create in Amazon
      # DynamoDB. You can also get the vault inventory to obtain a list of
      # archive IDs in a vault. For more information, see InitiateJob.
      #
      # You must provide a SHA256 tree hash of the data you are uploading. For
      # information about computing a SHA256 tree hash, see [Computing
      # Checksums][1].
      #
      # You can optionally specify an archive description of up to 1,024
      # printable ASCII characters. You can get the archive description when
      # you either retrieve the archive or get the vault inventory. For more
      # information, see InitiateJob. Amazon Glacier does not interpret the
      # description in any way. An archive description does not need to be
      # unique. You cannot use the description to retrieve or sort the archive
      # list.
      #
      # Archives are immutable. After you upload an archive, you cannot edit
      # the archive or its description.
      #
      # An AWS account has full permission to perform all operations
      # (actions). However, AWS Identity and Access Management (IAM) users
      # don\'t have any permissions by default. You must grant them explicit
      # permission to perform specific actions. For more information, see
      # [Access Control Using AWS Identity and Access Management (IAM)][2].
      #
      # For conceptual information and underlying REST API, go to [Uploading
      # an Archive in Amazon Glacier][3] and [Upload Archive][4] in the
      # *Amazon Glacier Developer Guide*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/amazonglacier/latest/dev/checksum-calculations.html
      # [2]: http://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html
      # [3]: http://docs.aws.amazon.com/amazonglacier/latest/dev/uploading-an-archive.html
      # [4]: http://docs.aws.amazon.com/amazonglacier/latest/dev/api-archive-post.html
      # @option params [required, String] :vault_name
      #   The name of the vault.
      # @option params [required, String] :account_id
      #   The `AccountId` value is the AWS account ID of the account that owns
      #   the vault. You can either specify an AWS account ID or optionally a
      #   single apos`-`apos (hyphen), in which case Amazon Glacier uses the AWS
      #   account ID associated with the credentials used to sign the request.
      #   If you use an account ID, do not include any hyphens (apos-apos) in
      #   the ID.
      # @option params [String] :archive_description
      #   The optional description of the archive you are uploading.
      # @option params [String] :checksum
      #   The SHA256 tree hash of the data being uploaded.
      # @option params [String, IO] :body
      #   The data to upload.
      # @return [Types::ArchiveCreationOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::ArchiveCreationOutput#location #location} => String
      #   * {Types::ArchiveCreationOutput#checksum #checksum} => String
      #   * {Types::ArchiveCreationOutput#archive_id #archiveId} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.upload_archive({
      #     vault_name: "string", # required
      #     account_id: "string", # required
      #     archive_description: "string",
      #     checksum: "string",
      #     body: "data",
      #   })
      #
      # @example Response structure
      #   resp.location #=> String
      #   resp.checksum #=> String
      #   resp.archive_id #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def upload_archive(params = {}, options = {})
        req = build_request(:upload_archive, params)
        req.send_request(options)
      end

      # This operation uploads a part of an archive. You can upload archive
      # parts in any order. You can also upload them in parallel. You can
      # upload up to 10,000 parts for a multipart upload.
      #
      # Amazon Glacier rejects your upload part request if any of the
      # following conditions is true:
      #
      # * **SHA256 tree hash does not match**To ensure that part data is not
      #   corrupted in transmission, you compute a SHA256 tree hash of the
      #   part and include it in your request. Upon receiving the part data,
      #   Amazon Glacier also computes a SHA256 tree hash. If these hash
      #   values don\'t match, the operation fails. For information about
      #   computing a SHA256 tree hash, see [Computing Checksums][1].
      #
      # * **Part size does not match**The size of each part except the last
      #   must match the size specified in the corresponding
      #   InitiateMultipartUpload request. The size of the last part must be
      #   the same size as, or smaller than, the specified size.
      # 
      #   <note markdown="1">If you upload a part whose size is smaller than the part size you
      #   specified in your initiate multipart upload request and that part is
      #   not the last part, then the upload part request will succeed.
      #   However, the subsequent Complete Multipart Upload request will fail.
      # 
      #   </note>
      #
      # * **Range does not align**The byte range value in the request does not
      #   align with the part size specified in the corresponding initiate
      #   request. For example, if you specify a part size of 4194304 bytes (4
      #   MB), then 0 to 4194303 bytes (4 MB - 1) and 4194304 (4 MB) to
      #   8388607 (8 MB - 1) are valid part ranges. However, if you set a
      #   range value of 2 MB to 6 MB, the range does not align with the part
      #   size and the upload will fail.
      #
      # This operation is idempotent. If you upload the same part multiple
      # times, the data included in the most recent request overwrites the
      # previously uploaded data.
      #
      # An AWS account has full permission to perform all operations
      # (actions). However, AWS Identity and Access Management (IAM) users
      # don\'t have any permissions by default. You must grant them explicit
      # permission to perform specific actions. For more information, see
      # [Access Control Using AWS Identity and Access Management (IAM)][2].
      #
      # For conceptual information and underlying REST API, go to [Uploading
      # Large Archives in Parts (Multipart Upload)][3] and [Upload Part ][4]
      # in the *Amazon Glacier Developer Guide*.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/amazonglacier/latest/dev/checksum-calculations.html
      # [2]: http://docs.aws.amazon.com/amazonglacier/latest/dev/using-iam-with-amazon-glacier.html
      # [3]: http://docs.aws.amazon.com/amazonglacier/latest/dev/uploading-archive-mpu.html
      # [4]: http://docs.aws.amazon.com/amazonglacier/latest/dev/api-upload-part.html
      # @option params [required, String] :account_id
      #   The `AccountId` value is the AWS account ID of the account that owns
      #   the vault. You can either specify an AWS account ID or optionally a
      #   single apos`-`apos (hyphen), in which case Amazon Glacier uses the AWS
      #   account ID associated with the credentials used to sign the request.
      #   If you use an account ID, do not include any hyphens (apos-apos) in
      #   the ID.
      # @option params [required, String] :vault_name
      #   The name of the vault.
      # @option params [required, String] :upload_id
      #   The upload ID of the multipart upload.
      # @option params [String] :checksum
      #   The SHA256 tree hash of the data being uploaded.
      # @option params [String] :range
      #   Identifies the range of bytes in the assembled archive that will be
      #   uploaded in this part. Amazon Glacier uses this information to
      #   assemble the archive in the proper sequence. The format of this header
      #   follows RFC 2616. An example header is Content-Range:bytes
      #   0-4194303/\*.
      # @option params [String, IO] :body
      #   The data to upload.
      # @return [Types::UploadMultipartPartOutput] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::UploadMultipartPartOutput#checksum #checksum} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.upload_multipart_part({
      #     account_id: "string", # required
      #     vault_name: "string", # required
      #     upload_id: "string", # required
      #     checksum: "string",
      #     range: "string",
      #     body: "data",
      #   })
      #
      # @example Response structure
      #   resp.checksum #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def upload_multipart_part(params = {}, options = {})
        req = build_request(:upload_multipart_part, params)
        req.send_request(options)
      end

      # @!endgroup

      # @param [Symbol] waiter_name
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      # @option options [Integer] :max_attempts
      # @option options [Integer] :delay
      # @option options [Proc] :before_attempt
      # @option options [Proc] :before_wait
      def wait_until(waiter_name, params = {}, options = {})
        w = waiter(waiter_name, options)
        yield(w.waiter) if block_given? # deprecated
        w.wait(params)
      end

      def waiter_names
        waiters.keys
      end

      private

      # @param [Symbol] waiter_name
      # @param [Hash] options ({})
      def waiter(waiter_name, options = {})
        waiter_class = waiters[waiter_name]
        if waiter_class
          waiter_class.new(options.merge(client: self))
        else
          raise Aws::Waiters::Errors::NoSuchWaiterError.new(waiter_name, waiters.keys)
        end
      end

      def waiters
        {
          vault_exists: Waiters::VaultExists,
          vault_not_exists: Waiters::VaultNotExists
        }
      end

      # @api private
      class << self

        # @api private
        attr_reader :identifier

        def errors_module
          Errors
        end

      end
    end
  end
end