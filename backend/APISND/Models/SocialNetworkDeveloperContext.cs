using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace APISND.Models
{
    public partial class SocialNetworkDeveloperContext : DbContext
    {
        public SocialNetworkDeveloperContext()
        {
        }

        public SocialNetworkDeveloperContext(DbContextOptions<SocialNetworkDeveloperContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Categoria> Categorias { get; set; }
        public virtual DbSet<Chat> Chats { get; set; }
        public virtual DbSet<Comentario> Comentarios { get; set; }
        public virtual DbSet<Contacto> Contactos { get; set; }
        public virtual DbSet<Departamento> Departamentos { get; set; }
        public virtual DbSet<EstadoComentario> EstadoComentarios { get; set; }
        public virtual DbSet<EstadoPublicacion> EstadoPublicacions { get; set; }
        public virtual DbSet<Municipio> Municipios { get; set; }
        public virtual DbSet<OrdenesCompra> OrdenesCompras { get; set; }
        public virtual DbSet<OrdenesComprasDetalle> OrdenesComprasDetalles { get; set; }
        public virtual DbSet<OrdenesVenta> OrdenesVentas { get; set; }
        public virtual DbSet<OrdenesVentasDetalle> OrdenesVentasDetalles { get; set; }
        public virtual DbSet<Publicacione> Publicaciones { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<SubCategoria> SubCategorias { get; set; }
        public virtual DbSet<TipoComentario> TipoComentarios { get; set; }
        public virtual DbSet<TipoPublicacion> TipoPublicacions { get; set; }
        public virtual DbSet<Usuario> Usuarios { get; set; }
        public virtual DbSet<Whislist> Whislists { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                //optionsBuilder.UseSqlServer("data source=PROGRAMACION-3;initial catalog=SocialNetworkDeveloper;user id=sa;password=Fasan1;");
//#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("data source=DOUGLAS;initial catalog=SocialNetworkDeveloper; Integrated Security = True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "Modern_Spanish_CI_AS");

            modelBuilder.Entity<Categoria>(entity =>
            {
                entity.HasKey(e => e.IdCategoria)
                    .HasName("pk_categorias");

                entity.Property(e => e.IdCategoria).HasColumnName("idCategoria");

                entity.Property(e => e.EstadoCategoria).HasColumnName("estadoCategoria");

                entity.Property(e => e.NombreCategoria)
                    .HasMaxLength(100)
                    .HasColumnName("nombreCategoria");
            });

            modelBuilder.Entity<Chat>(entity =>
            {
                entity.HasKey(e => e.IdChat)
                    .HasName("pk_chat");

                entity.ToTable("Chat");

                entity.Property(e => e.IdChat)
                    .ValueGeneratedNever()
                    .HasColumnName("idChat");

                entity.Property(e => e.EstadoChat).HasColumnName("estadoChat");

                entity.Property(e => e.EstadoMensaje).HasColumnName("estadoMensaje");

                entity.Property(e => e.IdUsuarioDestinatario).HasColumnName("idUsuarioDestinatario");

                entity.Property(e => e.IdUsuarioEmisor).HasColumnName("idUsuarioEmisor");

                entity.Property(e => e.Mensaje).HasColumnType("text");

                entity.HasOne(d => d.IdUsuarioDestinatarioNavigation)
                    .WithMany(p => p.ChatIdUsuarioDestinatarioNavigations)
                    .HasForeignKey(d => d.IdUsuarioDestinatario)
                    .HasConstraintName("fk_chat_usuarios_destinatario");

                entity.HasOne(d => d.IdUsuarioEmisorNavigation)
                    .WithMany(p => p.ChatIdUsuarioEmisorNavigations)
                    .HasForeignKey(d => d.IdUsuarioEmisor)
                    .HasConstraintName("fk_chat_usuarios_emisor");
            });

            modelBuilder.Entity<Comentario>(entity =>
            {
                entity.HasKey(e => e.IdComentario)
                    .HasName("pk_comentarios");

                entity.Property(e => e.IdComentario).HasColumnName("idComentario");

                entity.Property(e => e.Comentario1)
                    .HasColumnType("text")
                    .HasColumnName("Comentario");

                entity.Property(e => e.IdComentarioPrincipal).HasColumnName("idComentarioPrincipal");

                entity.Property(e => e.IdEstadoComentario).HasColumnName("idEstadoComentario");

                entity.Property(e => e.IdTipoComentario).HasColumnName("idTipoComentario");

                entity.HasOne(d => d.IdEstadoComentarioNavigation)
                    .WithMany(p => p.Comentarios)
                    .HasForeignKey(d => d.IdEstadoComentario)
                    .HasConstraintName("fk_comentarios_estado_comentario");

                entity.HasOne(d => d.IdTipoComentarioNavigation)
                    .WithMany(p => p.Comentarios)
                    .HasForeignKey(d => d.IdTipoComentario)
                    .HasConstraintName("fk_comentarios_tipo");
            });

            modelBuilder.Entity<Contacto>(entity =>
            {
                entity.HasKey(e => e.IdContacto)
                    .HasName("pk_contactos");

                entity.Property(e => e.IdContacto).HasColumnName("idContacto");

                entity.Property(e => e.Estado).HasColumnName("estado");

                entity.Property(e => e.IdUsuario).HasColumnName("idUsuario");

                entity.Property(e => e.IdUsuarioContacto).HasColumnName("idUsuarioContacto");

                entity.HasOne(d => d.IdUsuarioNavigation)
                    .WithMany(p => p.ContactoIdUsuarioNavigations)
                    .HasForeignKey(d => d.IdUsuario)
                    .HasConstraintName("fk_contatos_usuario");

                entity.HasOne(d => d.IdUsuarioContactoNavigation)
                    .WithMany(p => p.ContactoIdUsuarioContactoNavigations)
                    .HasForeignKey(d => d.IdUsuarioContacto)
                    .HasConstraintName("fk_contactos_usuarios2");
            });

            modelBuilder.Entity<Departamento>(entity =>
            {
                entity.HasKey(e => e.IdDepartamento)
                    .HasName("pk_departamentos");

                entity.Property(e => e.IdDepartamento).HasColumnName("idDepartamento");

                entity.Property(e => e.Departamento1)
                    .HasMaxLength(150)
                    .HasColumnName("Departamento");

                entity.Property(e => e.Estado).HasColumnName("estado");
            });

            modelBuilder.Entity<EstadoComentario>(entity =>
            {
                entity.HasKey(e => e.IdEstadoComentario)
                    .HasName("pk_estado_comentario");

                entity.ToTable("EstadoComentario");

                entity.Property(e => e.IdEstadoComentario).HasColumnName("idEstadoComentario");

                entity.Property(e => e.Estado)
                    .HasMaxLength(100)
                    .HasColumnName("estado");
            });

            modelBuilder.Entity<EstadoPublicacion>(entity =>
            {
                entity.HasKey(e => e.IdEstadoPublicacion)
                    .HasName("pk_estado_publicacion");

                entity.ToTable("EstadoPublicacion");

                entity.Property(e => e.IdEstadoPublicacion).HasColumnName("idEstadoPublicacion");

                entity.Property(e => e.Estado)
                    .HasMaxLength(100)
                    .HasColumnName("estado");
            });

            modelBuilder.Entity<Municipio>(entity =>
            {
                entity.HasKey(e => e.IdMunicipio)
                    .HasName("pk_municipios");

                entity.Property(e => e.IdMunicipio).HasColumnName("idMunicipio");

                entity.Property(e => e.IdDepartamento).HasColumnName("idDepartamento");

                entity.Property(e => e.Municipio1)
                    .HasMaxLength(255)
                    .HasColumnName("Municipio");

                entity.HasOne(d => d.IdDepartamentoNavigation)
                    .WithMany(p => p.Municipios)
                    .HasForeignKey(d => d.IdDepartamento)
                    .HasConstraintName("fk_municipios_departamentos");
            });

            modelBuilder.Entity<OrdenesCompra>(entity =>
            {
                entity.HasKey(e => e.IdOrdenCompra);

                entity.Property(e => e.IdOrdenCompra).HasColumnName("idOrdenCompra");

                entity.Property(e => e.EstadoOrdenCompra)
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .HasColumnName("estadoOrdenCompra")
                    .IsFixedLength(true);

                entity.Property(e => e.FechaHoraOrdenCompra)
                    .HasColumnType("datetime")
                    .HasColumnName("fechaHoraOrdenCompra");

                entity.Property(e => e.IdPublicacion).HasColumnName("idPublicacion");

                entity.Property(e => e.IdUsuario).HasColumnName("idUsuario");

                entity.Property(e => e.TotalCompraConIva)
                    .HasColumnType("decimal(10, 4)")
                    .HasColumnName("totalCompraConIva");

                entity.Property(e => e.TotalCompraSinIva)
                    .HasColumnType("decimal(10, 0)")
                    .HasColumnName("totalCompraSinIva");

                entity.HasOne(d => d.IdPublicacionNavigation)
                    .WithMany(p => p.OrdenesCompras)
                    .HasForeignKey(d => d.IdPublicacion)
                    .HasConstraintName("FK_OrdenesCompras_Publicaciones");

                entity.HasOne(d => d.IdUsuarioNavigation)
                    .WithMany(p => p.OrdenesCompras)
                    .HasForeignKey(d => d.IdUsuario)
                    .HasConstraintName("FK_OrdenesCompras_Usuarios");
            });

            modelBuilder.Entity<OrdenesComprasDetalle>(entity =>
            {
                entity.HasKey(e => e.IdOrdenCompraDetalle);

                entity.Property(e => e.IdOrdenCompraDetalle).HasColumnName("idOrdenCompraDetalle");

                entity.Property(e => e.Cantidad).HasColumnType("decimal(10, 4)");

                entity.Property(e => e.EstadoOrdenCompraDetalle).HasColumnName("estadoOrdenCompraDetalle");

                entity.Property(e => e.IdOrdenCompra).HasColumnName("idOrdenCompra");

                entity.Property(e => e.MontoConIva)
                    .HasColumnType("decimal(10, 4)")
                    .HasColumnName("montoConIva");

                entity.Property(e => e.MontoSinIva)
                    .HasColumnType("decimal(10, 4)")
                    .HasColumnName("montoSinIva");

                entity.HasOne(d => d.IdOrdenCompraNavigation)
                    .WithMany(p => p.OrdenesComprasDetalles)
                    .HasForeignKey(d => d.IdOrdenCompra)
                    .HasConstraintName("FK_OrdenesComprasDetalles_OrdenesCompras");
            });

            modelBuilder.Entity<OrdenesVenta>(entity =>
            {
                entity.HasKey(e => e.IdOrdenVenta)
                    .HasName("PK_OrdenesNegocios");

                entity.Property(e => e.IdOrdenVenta).HasColumnName("idOrdenVenta");

                entity.Property(e => e.EstadoOrdenVenta)
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .HasColumnName("estadoOrdenVenta")
                    .IsFixedLength(true);

                entity.Property(e => e.FechaHoraOrdenVenta)
                    .HasColumnType("datetime")
                    .HasColumnName("fechaHoraOrdenVenta");

                entity.Property(e => e.IdPublicacion).HasColumnName("idPublicacion");

                entity.Property(e => e.IdUsuario).HasColumnName("idUsuario");

                entity.Property(e => e.TotalVentaConIva)
                    .HasColumnType("decimal(10, 4)")
                    .HasColumnName("totalVentaConIva");

                entity.Property(e => e.TotalVentaSinIva)
                    .HasColumnType("decimal(10, 0)")
                    .HasColumnName("totalVentaSinIva");

                entity.HasOne(d => d.IdPublicacionNavigation)
                    .WithMany(p => p.OrdenesVenta)
                    .HasForeignKey(d => d.IdPublicacion)
                    .HasConstraintName("FK_OrdenesNegocios_Publicaciones");

                entity.HasOne(d => d.IdUsuarioNavigation)
                    .WithMany(p => p.OrdenesVenta)
                    .HasForeignKey(d => d.IdUsuario)
                    .HasConstraintName("FK_OrdenesNegocios_Usuarios");
            });

            modelBuilder.Entity<OrdenesVentasDetalle>(entity =>
            {
                entity.HasKey(e => e.IdOrdenVentaDetalle)
                    .HasName("PK_OrdenesNegociosDetalles");

                entity.Property(e => e.IdOrdenVentaDetalle).HasColumnName("idOrdenVentaDetalle");

                entity.Property(e => e.Cantidad).HasColumnType("decimal(10, 4)");

                entity.Property(e => e.EstadoOrdenNegocioDetalle).HasColumnName("estadoOrdenNegocioDetalle");

                entity.Property(e => e.IdOrdenVenta).HasColumnName("idOrdenVenta");

                entity.Property(e => e.MontoConIva)
                    .HasColumnType("decimal(10, 4)")
                    .HasColumnName("montoConIva");

                entity.Property(e => e.MontoSinIva)
                    .HasColumnType("decimal(10, 4)")
                    .HasColumnName("montoSinIva");

                entity.HasOne(d => d.IdOrdenVentaNavigation)
                    .WithMany(p => p.OrdenesVentasDetalles)
                    .HasForeignKey(d => d.IdOrdenVenta)
                    .HasConstraintName("FK_OrdenesNegociosDetalles_OrdenesNegocios");
            });

            modelBuilder.Entity<Publicacione>(entity =>
            {
                entity.HasKey(e => e.IdPublicacion)
                    .HasName("pk_pulicaciones");

                entity.Property(e => e.IdPublicacion).HasColumnName("idPublicacion");

                entity.Property(e => e.Delivery)
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength(true);

                entity.Property(e => e.Descripcion).HasMaxLength(250);

                entity.Property(e => e.FechaCreacion)
                    .HasColumnType("datetime")
                    .HasColumnName("fechaCreacion");

                entity.Property(e => e.FechaPublicacion)
                    .HasColumnType("datetime")
                    .HasColumnName("fechaPublicacion");

                entity.Property(e => e.IdCategoria).HasColumnName("idCategoria");

                entity.Property(e => e.IdDepartamento).HasColumnName("idDepartamento");

                entity.Property(e => e.IdEstadoPublicacion).HasColumnName("idEstadoPublicacion");

                entity.Property(e => e.IdMunicipio).HasColumnName("idMunicipio");

                entity.Property(e => e.IdSubCategoria).HasColumnName("idSubCategoria");

                entity.Property(e => e.IdTipoPublicacion).HasColumnName("idTipoPublicacion");

                entity.Property(e => e.IdUsuario).HasColumnName("idUsuario");

                entity.Property(e => e.Imagen).HasColumnType("image");

                entity.Property(e => e.Precio).HasColumnType("decimal(14, 2)");

                entity.Property(e => e.Titulo).HasMaxLength(150);

                entity.HasOne(d => d.IdDepartamentoNavigation)
                    .WithMany(p => p.Publicaciones)
                    .HasForeignKey(d => d.IdDepartamento)
                    .HasConstraintName("FK_Publicaciones_Departamentos");

                entity.HasOne(d => d.IdEstadoPublicacionNavigation)
                    .WithMany(p => p.Publicaciones)
                    .HasForeignKey(d => d.IdEstadoPublicacion)
                    .HasConstraintName("fk_publicaciones_estado");

                entity.HasOne(d => d.IdMunicipioNavigation)
                    .WithMany(p => p.Publicaciones)
                    .HasForeignKey(d => d.IdMunicipio)
                    .HasConstraintName("FK_Publicaciones_Municipios");

                entity.HasOne(d => d.IdSubCategoriaNavigation)
                    .WithMany(p => p.Publicaciones)
                    .HasForeignKey(d => d.IdSubCategoria)
                    .HasConstraintName("fk_publicaciones_subcategorias");

                entity.HasOne(d => d.IdTipoPublicacionNavigation)
                    .WithMany(p => p.Publicaciones)
                    .HasForeignKey(d => d.IdTipoPublicacion)
                    .HasConstraintName("fk_publicaciones_tipo");

                entity.HasOne(d => d.IdUsuarioNavigation)
                    .WithMany(p => p.Publicaciones)
                    .HasForeignKey(d => d.IdUsuario)
                    .HasConstraintName("FK_Publicaciones_Usuarios");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.HasKey(e => e.IdRol)
                    .HasName("pk_roles");

                entity.Property(e => e.IdRol).HasColumnName("idRol");

                entity.Property(e => e.Rol).HasMaxLength(25);
            });

            modelBuilder.Entity<SubCategoria>(entity =>
            {
                entity.HasKey(e => e.IdSubCategoria)
                    .HasName("pk_subcategorias");

                entity.Property(e => e.IdSubCategoria).HasColumnName("idSubCategoria");

                entity.Property(e => e.IdCategoria).HasColumnName("idCategoria");

                entity.Property(e => e.NombreSubCategoria)
                    .HasMaxLength(100)
                    .HasColumnName("nombreSubCategoria");

                entity.HasOne(d => d.IdCategoriaNavigation)
                    .WithMany(p => p.SubCategoria)
                    .HasForeignKey(d => d.IdCategoria)
                    .HasConstraintName("fk_subcategorias_categorias");
            });

            modelBuilder.Entity<TipoComentario>(entity =>
            {
                entity.HasKey(e => e.IdTipoComentario)
                    .HasName("pk_tipo_comentario");

                entity.ToTable("TipoComentario");

                entity.Property(e => e.IdTipoComentario).HasColumnName("idTipoComentario");

                entity.Property(e => e.Tipo)
                    .HasMaxLength(100)
                    .HasColumnName("tipo");
            });

            modelBuilder.Entity<TipoPublicacion>(entity =>
            {
                entity.HasKey(e => e.IdTipoPublicacion)
                    .HasName("pk_tipo_publicacion");

                entity.ToTable("TipoPublicacion");

                entity.Property(e => e.IdTipoPublicacion).HasColumnName("idTipoPublicacion");

                entity.Property(e => e.TipoPublicacion1)
                    .HasMaxLength(100)
                    .HasColumnName("tipoPublicacion");
            });

            modelBuilder.Entity<Usuario>(entity =>
            {
                entity.HasKey(e => e.IdUsuario)
                    .HasName("pk_usuarios");

                entity.Property(e => e.IdUsuario).HasColumnName("idUsuario");

                entity.Property(e => e.Apellidos).HasMaxLength(125);

                entity.Property(e => e.Comprador)
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .HasDefaultValueSql("('N')")
                    .IsFixedLength(true);

                entity.Property(e => e.Contrasena).HasMaxLength(25);

                entity.Property(e => e.CorreoElectronico)
                    .HasMaxLength(150)
                    .HasColumnName("correoElectronico");

                entity.Property(e => e.Direccion).HasMaxLength(300);

                entity.Property(e => e.Dui).HasMaxLength(10);

                entity.Property(e => e.EstadoUsuario).HasColumnName("estadoUsuario");

                entity.Property(e => e.IdDepartamento).HasColumnName("idDepartamento");

                entity.Property(e => e.IdMunicipio).HasColumnName("idMunicipio");

                entity.Property(e => e.IdRol).HasColumnName("idRol");

                entity.Property(e => e.Nit).HasMaxLength(16);

                entity.Property(e => e.NombreCompleto)
                    .HasMaxLength(250)
                    .HasColumnName("nombreCompleto");

                entity.Property(e => e.Nombres).HasMaxLength(125);

                entity.Property(e => e.TelefonoContacto)
                    .HasMaxLength(15)
                    .HasColumnName("telefonoContacto");

                entity.Property(e => e.Vendedor)
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .HasDefaultValueSql("('Y')")
                    .IsFixedLength(true);

                entity.HasOne(d => d.IdDepartamentoNavigation)
                    .WithMany(p => p.Usuarios)
                    .HasForeignKey(d => d.IdDepartamento)
                    .HasConstraintName("FK_Usuarios_Departamentos");

                entity.HasOne(d => d.IdMunicipioNavigation)
                    .WithMany(p => p.Usuarios)
                    .HasForeignKey(d => d.IdMunicipio)
                    .HasConstraintName("FK_Usuarios_Municipios");

                entity.HasOne(d => d.IdRolNavigation)
                    .WithMany(p => p.Usuarios)
                    .HasForeignKey(d => d.IdRol)
                    .HasConstraintName("fk_usuarios_roles");
            });

            modelBuilder.Entity<Whislist>(entity =>
            {
                entity.HasKey(e => e.IdWhislist)
                    .HasName("pk_whislist");

                entity.ToTable("Whislist");

                entity.Property(e => e.IdWhislist).HasColumnName("idWhislist");

                entity.Property(e => e.EstadoWishlist).HasColumnName("estadoWishlist");

                entity.Property(e => e.FechaCreacion)
                    .HasColumnType("datetime")
                    .HasColumnName("fechaCreacion");

                entity.Property(e => e.IdPublicacion).HasColumnName("idPublicacion");

                entity.Property(e => e.IdUsuario).HasColumnName("idUsuario");

                entity.HasOne(d => d.IdPublicacionNavigation)
                    .WithMany(p => p.Whislists)
                    .HasForeignKey(d => d.IdPublicacion)
                    .HasConstraintName("fk_whislist_publicaciones");

                entity.HasOne(d => d.IdUsuarioNavigation)
                    .WithMany(p => p.Whislists)
                    .HasForeignKey(d => d.IdUsuario)
                    .HasConstraintName("fk_whislist_usuarios");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
